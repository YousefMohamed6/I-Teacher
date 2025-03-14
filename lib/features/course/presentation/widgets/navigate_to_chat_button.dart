import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mrjoo/features/chat/presentation/views/chat_view.dart';
import 'package:mrjoo/features/course/presentation/manager/course_cubit.dart';

class NavigateToChatButton extends StatelessWidget {
  const NavigateToChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final student = context.read<CourseCubit>().student;
        context.pushNamed(ChatView.routeName, extra: student);
      },
      icon: const Icon(
        Icons.chat,
        color: Colors.white,
      ),
    );
  }
}
