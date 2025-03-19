import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/features/chatbot/presentation/manager/chatbot_cubit.dart';
import 'package:mrjoo/features/chatbot/presentation/widgets/chatbot_text_field.dart';
import 'package:mrjoo/features/chatbot/presentation/widgets/custom_chat_bubble.dart';

class ChatbotBody extends StatelessWidget {
  const ChatbotBody({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = context.watch<ChatbotCubit>().messages;
    return Background(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.all(8.0),
                child: ChatbotBubble(
                  chatbotModel: messages[index],
                ),
              ),
            ),
          ),
          ChatbotTextField(),
        ],
      ),
    );
  }
}
