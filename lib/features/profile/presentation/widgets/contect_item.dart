import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/core/widgets/custom_text_button.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.text,
    required this.textButton,
    required this.onPressed,
    this.mainAxisAlignment,
  });
  final String text;
  final String textButton;
  final VoidCallback onPressed;
  final MainAxisAlignment? mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment!,
      children: [
        CustomText(
          text: text,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
        CustomTextButton(
          text: textButton,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
