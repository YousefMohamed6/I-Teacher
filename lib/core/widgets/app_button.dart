import 'package:flutter/material.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 60,
      color: Colors.white,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onPressed: onPressed,
      child: CustomText(
        text: text,
        fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
      ),
    );
  }
}
