import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/time.dart';
import 'package:mrjoo/features/chat/data/chat_cubit/chat_cubit.dart';
import 'package:mrjoo/features/chat/data/model/message_model.dart';
import 'package:mrjoo/features/chat/presentation/views/widgets/friend_bubble.dart';
import 'package:mrjoo/features/chat/presentation/views/widgets/user_bubble.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key, required this.messages});
  final List<MessageModel> messages;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: BlocProvider.of<ChatCubit>(context).scrollController,
        reverse: true,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final user = FirebaseAuth.instance.currentUser;
          TimeHelper time = TimeHelper(message: messages[index]);
          if (user?.uid == messages[index].uId) {
            return UserBubble(
              message: messages[index],
              time: time,
            );
          } else {
            return FriendBubble(
              message: messages[index],
              time: time,
            );
          }
        },
      ),
    );
  }
}
