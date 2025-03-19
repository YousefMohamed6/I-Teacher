import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:mrjoo/features/chatbot/data/model/chatboot_model/chatboot_model.dart';

class ChatbotBubble extends StatelessWidget {
  const ChatbotBubble({super.key, required this.chatbotModel});
  final ChatbotModel chatbotModel;
  @override
  Widget build(BuildContext context) {
    bool isSender = chatbotModel.isSender;
    return BubbleNormal(
      text: chatbotModel.text,
      color: isSender ? Color(0xFF1B97F3) : Colors.grey,
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      isSender: isSender,
    );
  }
}
