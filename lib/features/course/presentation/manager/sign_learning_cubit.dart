import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iteacher/features/chatbot/domain/use_cases/ask_gemini_use_case.dart';
import 'package:iteacher/core/services/image_picker_service.dart';

part 'sign_learning_cubit.freezed.dart';
part 'sign_learning_state.dart';

class SignLearningCubit extends Cubit<SignLearningState> {
  final AskGeminiUseCase _askGeminiUseCase;
  final ImagePickerService _imagePickerService;

  SignLearningCubit(this._askGeminiUseCase, this._imagePickerService)
      : super(const SignLearningState.initial());

  final List<Map<String, String>> flashcards = [
    {'word': 'Teacher', 'hint': 'Sign for teacher'},
    {'word': 'Book', 'hint': 'Sign for book'},
    {'word': 'School', 'hint': 'Sign for school'},
  ];

  int currentIndex = 0;

  void nextCard() {
    if (currentIndex < flashcards.length - 1) {
      currentIndex++;
      emit(SignLearningState.updateUI(currentIndex));
    }
  }

  void previousCard() {
    if (currentIndex > 0) {
      currentIndex--;
      emit(SignLearningState.updateUI(currentIndex));
    }
  }

  Future<void> validateSign() async {
    try {
      emit(const SignLearningState.loading());
      final String imageBase64 = await _imagePickerService.pickImageAsBase64FromCamera();
      
      final word = flashcards[currentIndex]['word']!;
      final prompt = 'Is this person correctly signing the word "$word" in Sign Language? Answer with "Correct" or "Incorrect" and a short explanation.';
      
      final response = await _askGeminiUseCase.execute(
        prompt,
        imageBase64: imageBase64,
      );

      if (response.toLowerCase().contains('correct') && !response.toLowerCase().contains('incorrect')) {
        emit(SignLearningState.success('Perfect! You signed it correctly.'));
      } else {
        emit(SignLearningState.failure(response));
      }
    } catch (e) {
      emit(SignLearningState.failure(e.toString()));
    }
  }
}
