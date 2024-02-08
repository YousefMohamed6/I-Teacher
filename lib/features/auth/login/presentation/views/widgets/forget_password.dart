import 'package:flutter/material.dart';
import 'package:mrjoo/core/widgets/custom_text_button.dart';
import 'package:mrjoo/features/auth/forget_Password/view/forget_password_view.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomTextButton(
          text: 'Forget Your Password?',
          fontWeight: FontWeight.bold,
          onPressed: () {
            Navigator.pushNamed(context, ForgetPasswordView.id);
          },
        ),
      ],
    );
  }
}
