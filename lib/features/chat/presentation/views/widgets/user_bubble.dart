import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/time.dart';
import 'package:mrjoo/features/chat/data/model/message_model.dart';
import 'package:mrjoo/features/chat/presentation/views/widgets/chat_bubble.dart';

class UserBubble extends StatelessWidget {
  const UserBubble(
      {super.key,
      required this.message,
      required this.time,
      required this.user});
  final MessageModel message;
  final TimeHelper time;
  final User user;
  @override
  Widget build(BuildContext context) {
    return ChatBubble(
      fullName: user.displayName!,
      bubbleColor: kUserColor,
      bottonLeftRedius: 24.0,
      bottonRightRedius: 0.0,
      message: message.message,
      time: '${time.hour()} : ${time.minute()} ${time.state()}',
      alignmentMessage: Alignment.topRight,
    );
  }
}
