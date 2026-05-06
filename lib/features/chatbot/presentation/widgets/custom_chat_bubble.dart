import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:iteacher/core/extentions/theme_extension.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
import 'package:iteacher/features/chatbot/data/model/chatboot_model/chatboot_model.dart';

class ChatbotBubble extends StatelessWidget {
  const ChatbotBubble({super.key, required this.chatbotModel});
  final ChatbotModel chatbotModel;
  @override
  Widget build(BuildContext context) {
    bool isSender = chatbotModel.isSender;
    return BubbleNormal(
      text: chatbotModel.text,
      color: isSender ? context.chatSenderColor : context.chatReceiverColor,
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: AppDimensions.kPadding16,
      ),
      isSender: isSender,
    );
  }
}
