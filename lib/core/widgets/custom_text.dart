import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.color,
    this.textAlign,
    this.overflow,
    this.style,
  });
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: style ??
          TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            overflow: overflow,
          ),
    );
  }
}
