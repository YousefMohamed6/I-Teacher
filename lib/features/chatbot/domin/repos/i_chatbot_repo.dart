import 'package:mrjoo/features/chatbot/data/model/gemini_model/gemini_model.dart';

abstract class IChatbotRepo {
  Future<GeminiModel> getAnswer(String question);
}
