import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/core/widgets/custom_text_button.dart';
import 'package:mrjoo/features/customer/presentation/views/customer_page.dart';

class RegisterNow extends StatelessWidget {
  const RegisterNow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const CustomText(
          text: "don't have any account?",
          color: kMainTextColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        CustomTextButton(
          text: 'Register Now',
          fontWeight: FontWeight.bold,
          onPressed: () {
            Navigator.pushNamed(context, CustomerView.id);
          },
        ),
      ],
    );
  }
}
