import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mrjoo/features/chatbot/data/model/chatboot_model/chatboot_model.dart';
import 'package:mrjoo/features/chatbot/domin/use_cases/ask_gemini_use_case.dart';

part 'chatbot_cubit.freezed.dart';
part 'chatbot_state.dart';

class ChatbotCubit extends Cubit<ChatbotState> {
  final AskGeminiUseCase _askGeminiUseCase;
  ChatbotCubit(
    this._askGeminiUseCase,
  ) : super(ChatbotState.initial());
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

  void askQuestion(String question) async {
    if (question.isEmpty) return;
    sendQuestion(question);
    await reply(question);
  }

  Future<void> reply(String question) async {
    try {
      emit(ChatbotState.loading());
      final response = await _askGeminiUseCase.execute(question);
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
