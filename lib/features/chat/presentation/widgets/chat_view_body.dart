import 'package:flutter/material.dart';
import 'package:mrjoo/features/chat/data/model/message_model.dart';
import 'package:mrjoo/features/chat/presentation/widgets/chat_form_feild.dart';
import 'package:mrjoo/features/chat/presentation/widgets/chat_list_view.dart';

class ChatviewBody extends StatelessWidget {
  const ChatviewBody({super.key, required this.messages});
  final List<MessageModel> messages;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChatListView(messages: messages),
        const ChatFormField(),
      ],
    );
  }
}
