import 'package:flutter/material.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: CustomText(
        text: text,
      ),
    );
  }
}
