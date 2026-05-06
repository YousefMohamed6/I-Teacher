import 'package:iteacher/core/services/gemini_service.dart';
import 'package:iteacher/features/chatbot/data/model/gemini_model/gemini_model.dart';
import 'package:iteacher/features/chatbot/domain/repos/i_chatbot_repo.dart';

class ChatbotRepoImpl implements IChatbotRepo {
  final GeminiService geminiService;

  ChatbotRepoImpl(this.geminiService);

  @override
  Future<GeminiModel> getAnswer(String question, {String? imageBase64}) async {
    final response = await geminiService.askGemini(
      question: question,
      imageBase64: imageBase64,
    );
    return GeminiModel.fromJson(response);
  }
}
