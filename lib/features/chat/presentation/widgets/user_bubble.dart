import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/time.dart';
import 'package:mrjoo/features/chat/data/model/message_model.dart';
import 'package:mrjoo/features/chat/presentation/widgets/chat_bubble.dart';

class UserBubble extends StatelessWidget {
  const UserBubble({
    super.key,
    required this.message,
    required this.time,
  });
  final MessageModel message;
  final TimeHelper time;
  @override
  Widget build(BuildContext context) {
    return ChatBubble(
      bubbleColor: kUserColor,
      bottonLeftRedius: 24.0,
      bottonRightRedius: 0.0,
      message: message,
      time: time,
      alignmentMessage: Alignment.topRight,
    );
  }
}
