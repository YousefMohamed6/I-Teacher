import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/features/chat/data/models/text_message_model/text_message_model.dart';
import 'package:iteacher/features/chat/presentation/manager/chat_cubit.dart';

class TextMessageWidget extends StatelessWidget {
  const TextMessageWidget({super.key, required this.message});
  final TextMessageModel message;
  @override
  Widget build(BuildContext context) {
    bool isSender = context.read<ChatCubit>().getSender(message.userModel);
    return BubbleNormal(
      text: message.text,
      color: isSender ? Color(0xFF1B97F3) : Color(0xFFE8E8EE),
      tail: false,
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      isSender: isSender,
    );
  }
}
