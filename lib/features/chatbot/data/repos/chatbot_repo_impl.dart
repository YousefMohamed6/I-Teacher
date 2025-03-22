import 'package:iteacher/core/services/gemini_service.dart';
import 'package:iteacher/features/chatbot/data/model/gemini_model/gemini_model.dart';
import 'package:iteacher/features/chatbot/domin/repos/i_chatbot_repo.dart';

class ChatbotRepoImpl implements IChatbotRepo {
  final GeminiService geminiService;

  ChatbotRepoImpl(this.geminiService);

  @override
  Future<GeminiModel> getAnswer(String question) async {
    final response = await geminiService.askGemini(question: question);
    return GeminiModel.fromJson(response);
  }
}
