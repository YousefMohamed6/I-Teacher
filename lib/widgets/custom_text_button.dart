import 'package:flutter/material.dart';
import 'package:mrjoo/consts/colors.dart';
import 'package:mrjoo/widgets/custom_text.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontWeight,
    this.color,
  });
  final String text;
  final void Function() onPressed;
  final FontWeight? fontWeight;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: CustomText(
        text: text,
        fontSize: 16,
        fontWeight: fontWeight,
        color: color ?? kTextButton[900],
      ),
    );
  }
}
