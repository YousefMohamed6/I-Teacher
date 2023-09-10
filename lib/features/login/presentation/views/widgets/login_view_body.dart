import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/images.dart';
import 'package:mrjoo/core/widgets/avatar.dart';
import 'package:mrjoo/features/login/presentation/views/widgets/email_text_feild.dart';
import 'package:mrjoo/features/login/presentation/views/widgets/forget_password.dart';
import 'package:mrjoo/features/login/presentation/views/widgets/login_button.dart';
import 'package:mrjoo/features/login/presentation/views/widgets/password_text_feild.dart';
import 'package:mrjoo/features/login/presentation/views/widgets/register_now.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 48),
        const Avatar(image: kAvaterLogo),
        const SizedBox(height: 48),
        EmailTextFaild(
          formkey: GlobalKey<FormState>(),
          controller: TextEditingController(),
        ),
        const SizedBox(height: 16),
        PasswordTextFeild(
          controller: TextEditingController(),
          obscureText: false,
          formKey: GlobalKey<FormState>(),
          onSuffixIconPressed: () {},
        ),
        ForgetPassword(
          onPressed: () {},
        ),
        const SizedBox(height: 24),
        LoginButton(
          onPressed: () {},
        ),
        const SizedBox(height: 24),
        const RegisterNow(),
        const SizedBox(height: 16),
      ],
    );
  }
}
