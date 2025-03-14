import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/features/chat/presentation/manager/chat_cubit.dart';
import 'package:mrjoo/features/chat/presentation/widgets/record_audio_button.dart';

class CustomChatTextField extends StatelessWidget {
  const CustomChatTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ChatCubit>(context);
    return MessageBar(
      onSend: (text) => cubit.sendTextMessage(text),
      actions: [
        AttachmentButton(),
        SendImageButton(),
        AudioRecorderButton(),
      ],
    );
  }
}

class SendImageButton extends StatelessWidget {
  const SendImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ChatCubit>(context);
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Icon(
        Icons.camera_alt,
        color: Colors.green,
        size: 24,
      ),
      onPressed: () {
        cubit.sendImageMessage();
      },
    );
  }
}

class AttachmentButton extends StatelessWidget {
  const AttachmentButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ChatCubit>(context);
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Icon(
        Icons.add,
        color: Colors.black,
        size: 24,
      ),
      onPressed: () {
        cubit.sendFileMessage();
      },
    );
  }
}
