import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_icon_button.dart';
import 'package:mrjoo/features/chat/data/chat_cubit/chat_cubit.dart';
import 'package:mrjoo/features/chat/presentation/views/chat_view.dart';
import 'package:mrjoo/features/course/data/course_view_cubit/course_view_cubit.dart';
import 'package:mrjoo/features/course/presentation/widgets/sign_out_button.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    var user = BlocProvider.of<CourseCubit>(context).getLocalUser();
    return Row(
      children: [
        user.isAdmin
            ? CustomIconButton(
                onPressed: () {
                  BlocProvider.of<CourseCubit>(context)
                      .showBottomSheet(context: context);
                },
                icon: const Icon(Icons.add_to_queue),
              )
            : IconButton(
                onPressed: () {
                   BlocProvider.of<ChatCubit>(context).fetchFirebaseMessages();
                  Navigator.pushNamed(context, ChatView.id);
                },
                icon: const Icon(Icons.chat),
              ),
        const SignOutButton()
      ],
    );
  }
}
