import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/widgets/custom_button.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/login/data/login-cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: Colors.white,
      onPressed: () {
        var emailKey = BlocProvider.of<LoginViewCubit>(context).emailkey;
        var passwordKey = BlocProvider.of<LoginViewCubit>(context).passwordKey;
        if (emailKey.currentState!.validate()) {
          if (passwordKey.currentState!.validate()) {
            BlocProvider.of<LoginViewCubit>(context).loginUser();
          }
        }
      },
      child: const CustomText(
        text: 'Login',
        color: kPrimryColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
