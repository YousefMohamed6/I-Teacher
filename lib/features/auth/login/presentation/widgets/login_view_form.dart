import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/core/utils/constants/app_images.dart';
import 'package:mrjoo/core/widgets/avatar.dart';
import 'package:mrjoo/features/auth/login/presentation/widgets/email_text_feild.dart';
import 'package:mrjoo/features/auth/login/presentation/widgets/forget_password.dart';
import 'package:mrjoo/features/auth/login/presentation/widgets/login_button.dart';
import 'package:mrjoo/features/auth/login/presentation/widgets/password_text_feild.dart';
import 'package:mrjoo/features/auth/login/presentation/widgets/register_now.dart';

class LoginViewForm extends StatelessWidget {
  const LoginViewForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 24.h),
        Avatar(imagePath: AppImages.kAvaterLogo),
        SizedBox(height: 32.h),
        EmailTextFaild(),
        SizedBox(height: 16.h),
        PasswordTextFeild(),
        ForgetPassword(),
        SizedBox(height: 24.h),
        LoginButton(),
        SizedBox(height: 24.h),
        RegisterNow(),
        SizedBox(height: 16.h),
      ],
    );
  }
}
