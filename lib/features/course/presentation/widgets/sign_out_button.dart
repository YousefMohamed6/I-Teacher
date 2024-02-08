import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_icon_button.dart';
import 'package:mrjoo/features/course/data/course_view_cubit/course_view_cubit.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: const Icon(
        Icons.logout_outlined,
        color: Colors.white,
      ),
      iconSize: 30,
      onPressed: () {
        BlocProvider.of<CourseCubit>(context).signOut();
      },
    );
  }
}
