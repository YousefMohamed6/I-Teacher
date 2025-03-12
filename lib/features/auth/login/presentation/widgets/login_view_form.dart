import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/core/utils/constants/app_images.dart';
import 'package:mrjoo/core/widgets/avatar.dart';
import 'package:mrjoo/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:mrjoo/features/auth/login/presentation/widgets/check_box_role.dart';
import 'package:mrjoo/features/auth/login/presentation/widgets/email_text_field.dart';
import 'package:mrjoo/features/auth/login/presentation/widgets/forget_password.dart';
import 'package:mrjoo/features/auth/login/presentation/widgets/login_button.dart';
import 'package:mrjoo/features/auth/login/presentation/widgets/password_text_field.dart';
import 'package:mrjoo/features/auth/login/presentation/widgets/register_now.dart';

class LoginViewForm extends StatelessWidget {
  const LoginViewForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<LoginCubit>(context).formKey,
      child: ListView(
        children: [
          SizedBox(height: 16.h),
          Avatar(imagePath: AppImages.kAvaterLogo),
          SizedBox(height: 16.h),
          EmailTextField(),
          SizedBox(height: 16.h),
          PasswordTextField(),
          CheckBoxRole(),
          ForgetPassword(),
          SizedBox(height: 16.h),
          LoginButton(),
          RegisterNow(),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
