import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_icon_button.dart';
import 'package:mrjoo/features/home/data/home_cubit/home_cubit.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: CustomIconButton(
        icon: const Icon(
          Icons.login_outlined,
          size: 26,
        ),
        onPressed: () {
          BlocProvider.of<HomeViewCubit>(context).chechLoginState();
        },
      ),
    );
  }
}