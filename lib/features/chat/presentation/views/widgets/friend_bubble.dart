import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/time.dart';
import 'package:mrjoo/features/chat/data/model/message_model.dart';
import 'package:mrjoo/features/chat/presentation/views/widgets/chat_bubble.dart';

class FriendBubble extends StatelessWidget {
  const FriendBubble({super.key, required this.message, required this.time});
  final MessageModel message;
  final TimeHelper time;
  @override
  Widget build(BuildContext context) {
    return ChatBubble(
      fullName: message.fullName,
      bubbleColor: kFriendColor,
      bottonLeftRedius: 0.0,
      bottonRightRedius: 24.0,
      message: message.content,
      time: '${time.hour()} : ${time.minute()} ${time.state()}',
      alignmentMessage: Alignment.topLeft,
    );
  }
}
