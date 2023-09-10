import 'package:flutter/material.dart';
import 'package:mrjoo/core/widgets/custom_text_button.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomTextButton(
          text: 'Forget Password',
          fontWeight: FontWeight.bold,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
