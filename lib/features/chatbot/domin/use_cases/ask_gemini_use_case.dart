import 'package:iteacher/features/chatbot/domin/repos/i_chatbot_repo.dart';

class AskGeminiUseCase {
  final IChatbotRepo _chatbotRepo;
  AskGeminiUseCase(this._chatbotRepo);
  Future<String> execute(String question) async {
    final response = await _chatbotRepo.getAnswer(question);
    return response.candidates?.first.content?.parts?.first.text ?? '';
  }
}
