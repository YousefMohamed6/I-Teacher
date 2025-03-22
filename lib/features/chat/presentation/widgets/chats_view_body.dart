import 'package:flutter/material.dart';
import 'package:iteacher/core/widgets/background.dart';
import 'package:iteacher/features/chat/presentation/widgets/all_chats.dart';
import 'package:iteacher/features/chat/presentation/widgets/chat_search_text_field.dart';

class ChatsViewBody extends StatelessWidget {
  const ChatsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        children: [
          ChatSearchTextField(),
          AllChats(),
        ],
      ),
    );
  }
}
