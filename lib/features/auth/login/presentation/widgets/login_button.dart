import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/core/widgets/custom_button.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: Colors.white,
      onPressed: () async {
        final emailKey = BlocProvider.of<LoginCubit>(context).emailkey;
        final passwordKey = BlocProvider.of<LoginCubit>(context).passwordKey;
        if (emailKey.currentState!.validate()) {
          if (!passwordKey.currentState!.validate()) {
            return;
          }
          BlocProvider.of<LoginCubit>(context).loginUser();
        }
      },
      child: CustomText(
        text: AppLocalizations.of(context)!.login,
        color: AppColors.kPrimryColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
