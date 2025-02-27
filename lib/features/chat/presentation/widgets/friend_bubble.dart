import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/features/chat/data/model/message_model.dart';
import 'package:mrjoo/features/chat/presentation/widgets/chat_bubble.dart';

class FriendBubble extends StatelessWidget {
  const FriendBubble({super.key, required this.message, required this.time});
  final MessageModel message;
  final DateTime time;
  @override
  Widget build(BuildContext context) {
    return ChatBubble(
      bubbleColor: AppColors.kFriendColor,
      bottonLeftRedius: 0.0,
      bottonRightRedius: 24.0,
      message: message,
      time: time,
      alignmentMessage: Alignment.topLeft,
    );
  }
}
