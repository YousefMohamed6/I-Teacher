import 'package:iteacher/features/chatbot/domain/repos/i_chatbot_repo.dart';

class AskGeminiUseCase {
  final IChatbotRepo _chatbotRepo;
  AskGeminiUseCase(this._chatbotRepo);
  Future<String> execute(String question, {String? imageBase64}) async {
    final response =
        await _chatbotRepo.getAnswer(question, imageBase64: imageBase64);
    return response.candidates?.first.content?.parts?.first.text ?? '';
  }
}
