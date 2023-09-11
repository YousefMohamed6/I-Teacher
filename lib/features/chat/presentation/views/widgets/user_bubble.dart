import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/time.dart';
import 'package:mrjoo/features/chat/data/model/local_message.dart';
import 'package:mrjoo/features/chat/presentation/views/widgets/chat_bubble.dart';

class UserBubble extends StatelessWidget {
  const UserBubble({
    super.key,
    required this.message,
    required this.time,
  });
  final LocalMessageModel message;
  final TimeHelper time;
  @override
  Widget build(BuildContext context) {
    return ChatBubble(
      fullName: message.fullName,
      bubbleColor: kUserColor,
      bottonLeftRedius: 24.0,
      bottonRightRedius: 0.0,
      message: message.content,
      time: '${time.hour()} : ${time.minute()} ${time.state()}',
      alignmentMessage: Alignment.topRight,
    );
  }
}
