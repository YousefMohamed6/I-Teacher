import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/widgets/custom_button.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/auth/login/presentation/manager/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: Colors.white,
      onPressed: () async {
        var emailKey = BlocProvider.of<LoginViewCubit>(context).emailkey;
        var passwordKey = BlocProvider.of<LoginViewCubit>(context).passwordKey;
        if (passwordKey.currentState!.validate()) {}
        if (emailKey.currentState!.validate()) {
          BlocProvider.of<LoginViewCubit>(context).loginUser();
        }
      },
      child: const CustomText(
        text: 'Login',
        color: AppColors.kPrimryColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
