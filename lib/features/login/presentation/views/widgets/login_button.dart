import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/widgets/custom_button.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: Colors.white,
      onPressed: onPressed,
      child: const CustomText(
        text: 'Login',
        color: kPrimryColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}