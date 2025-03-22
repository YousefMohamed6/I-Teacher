import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/features/chatbot/presentation/manager/chatbot_cubit.dart';
import 'package:iteacher/generated/app_localizations.dart';

class ChatbotTextField extends StatelessWidget {
  const ChatbotTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ChatbotCubit>(context);
    return MessageBar(
      onSend: (text) => cubit.askQuestion(text),
      messageBarHintText: AppLocalizations.of(context)!.write_message,
      actions: [],
    );
  }
}
