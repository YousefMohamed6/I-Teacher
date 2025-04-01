import 'package:flutter/material.dart';
import 'package:iteacher/features/chatbot/presentation/widgets/chatbot_body.dart';
import 'package:iteacher/generated/app_localizations.dart';

class ChatbotView extends StatelessWidget {
  const ChatbotView({super.key});
  static const routeName = "/ChatBot";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.chatbot),
      ),
      body: ChatbotBody(),
    );
  }
}
