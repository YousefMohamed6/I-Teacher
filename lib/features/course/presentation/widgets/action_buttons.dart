import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_icon_button.dart';
import 'package:mrjoo/features/chat/data/model/user_model.dart';
import 'package:mrjoo/features/chat/presentation/manager/chat_cubit.dart';
import 'package:mrjoo/features/chat/presentation/views/chat_view.dart';
import 'package:mrjoo/features/course/presentation/manager/course_view_cubit.dart';
import 'package:mrjoo/features/course/presentation/widgets/sign_out_button.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        user.isAdmin
            ? CustomIconButton(
                onPressed: () {
                  BlocProvider.of<CourseCubit>(context)
                      .showBottomSheet(context: context);
                },
                icon: const Icon(
                  Icons.add_to_queue,
                  color: Colors.white,
                ),
              )
            : IconButton(
                onPressed: () {
                  BlocProvider.of<ChatCubit>(context).fetchFirebaseMessages();
                  Navigator.pushNamed(context, ChatView.id);
                },
                icon: const Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
              ),
        const SignOutButton()
      ],
    );
  }
}
