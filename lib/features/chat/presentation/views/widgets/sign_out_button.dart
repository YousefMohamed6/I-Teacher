import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_icon_button.dart';
import 'package:mrjoo/features/chat/data/chat_cubit/chat_cubit.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: const Icon(Icons.logout_outlined),
      iconSize: 30,
      onPressed: () {
        BlocProvider.of<ChatCubit>(context).signOut();
      },
    );
  }
}
