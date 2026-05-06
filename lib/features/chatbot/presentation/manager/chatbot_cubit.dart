import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iteacher/features/chatbot/data/model/chatboot_model/chatboot_model.dart';
import 'package:iteacher/features/chatbot/domain/use_cases/ask_gemini_use_case.dart';
import 'package:iteacher/core/services/image_picker_service.dart';

part 'chatbot_cubit.freezed.dart';
part 'chatbot_state.dart';

class ChatbotCubit extends Cubit<ChatbotState> {
  final AskGeminiUseCase _askGeminiUseCase;
  final ImagePickerService _imagePickerService;
  ChatbotCubit(
    this._askGeminiUseCase,
    this._imagePickerService,
  ) : super(ChatbotState.initial());

  Future<void> pickImageAndAsk() async {
    try {
      final String imageBase64 =
          await _imagePickerService.pickImageAsBase64FromCamera();
      // Prompt Gemini to translate signs specifically if an image is provided
      final String prompt =
          "Please translate the sign language shown in this image.";
      askQuestion(prompt, imageBase64: imageBase64);
    } catch (e) {
      emit(ChatbotState.failure("Failed to pick image: $e"));
    }
  }
  ChatbotModel get message => ChatbotModel(
        isSender: true,
        text: '',
        createdAt: DateTime.now(),
      );
  List<ChatbotModel> messages = [];
  void sendQuestion(String question) {
    emit(ChatbotState.loading());
    final ChatbotModel ask = message..text = question;
    messages.add(ask);
    emit(ChatbotState<ChatbotModel>.success(ask));
  }

  void askQuestion(String question, {String? imageBase64}) async {
    if (question.isEmpty && imageBase64 == null) return;
    sendQuestion(question);
    await reply(question, imageBase64: imageBase64);
  }

  Future<void> reply(String question, {String? imageBase64}) async {
    try {
      emit(ChatbotState.loading());
      final response =
          await _askGeminiUseCase.execute(question, imageBase64: imageBase64);
      final ChatbotModel reply = message
        ..text = response
        ..isSender = false;
      messages.add(reply);
      emit(ChatbotState.success(reply));
    } catch (e) {
      emit(ChatbotState.failure(e.toString()));
    }
  }
}
