import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart' hide ChatState;
import 'package:mrjoo/features/chat/presentation/manager/chat_cubit.dart';

class ChatviewBody extends StatefulWidget {
  const ChatviewBody({super.key});

  @override
  State<ChatviewBody> createState() => _ChatviewBodyState();
}

class _ChatviewBodyState extends State<ChatviewBody> {
  void _handleAttachmentPressed() {
    final cubit = context.read<ChatCubit>();
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  cubit.handleImageSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  cubit.handleFileSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('File'),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ChatCubit>();
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (messages) => Chat(
              messages: messages,
              onAttachmentPressed: _handleAttachmentPressed,
              onMessageTap: (context, message) => () {},
              onPreviewDataFetched: (message, previewData) => () {},
              onSendPressed: (partialText) => cubit.sendMessage(
                    types.TextMessage(
                      author: types.User(
                        id: FirebaseAuth.instance.currentUser?.uid ?? '',
                        firstName:
                            FirebaseAuth.instance.currentUser?.displayName,
                        imageUrl: FirebaseAuth.instance.currentUser?.photoURL,
                      ),
                      id: FirebaseAuth.instance.currentUser?.uid ?? '',
                      createdAt: DateTime.now().millisecondsSinceEpoch,
                      text: partialText.text,
                    ),
                  ),
              showUserAvatars: true,
              showUserNames: true,

              user: types.User(
                id: FirebaseAuth.instance.currentUser?.uid ?? '',
                firstName: FirebaseAuth.instance.currentUser?.displayName,
                imageUrl: FirebaseAuth.instance.currentUser?.photoURL,
              )),
          failure: (error) => Center(child: Text(error)),
        );
      },
    );
  }
}
