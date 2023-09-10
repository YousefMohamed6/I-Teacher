import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/features/chat/data/chat_cubit/chat_cubit.dart';

class SendMessageButton extends StatelessWidget {
  const SendMessageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 16,
      onPressed: () {
        BlocProvider.of<ChatCubit>(context).sendMessage();
      },
      child: const Icon(
        Icons.send_sharp,
        color: kMainTextColor,
      ),
    );
  }
}