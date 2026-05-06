import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/core/utils/constants/app_images.dart';
import 'package:iteacher/core/widgets/avatar.dart';
import 'package:iteacher/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:iteacher/features/auth/login/presentation/widgets/custom_register_button.dart';
import 'package:iteacher/features/auth/login/presentation/widgets/email_text_field.dart';
import 'package:iteacher/features/auth/login/presentation/widgets/forget_password.dart';
import 'package:iteacher/features/auth/login/presentation/widgets/login_button.dart';
import 'package:iteacher/features/auth/login/presentation/widgets/password_text_field.dart';
import 'package:iteacher/features/register_student/presentation/Screens/student_view.dart';
import 'package:iteacher/features/register_teacher/presentation/Screens/register_teacher_view.dart';
import 'package:iteacher/generated/app_localizations.dart';

class LoginViewForm extends StatelessWidget {
  const LoginViewForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<LoginCubit>(context).formKey,
      child: ListView(
        children: [
          SizedBox(height: 16.h),
          Avatar(imagePath: AppImages.kAppLogo),
          SizedBox(height: 16.h),
          EmailTextField(),
          SizedBox(height: 8.h),
          PasswordTextField(),
          ForgetPassword(),
          SizedBox(height: 24.h),
          LoginButton(),
          SizedBox(height: 16.h),
          CustomRegisterButton(
            routeName: StudentView.routeName,
            title: AppLocalizations.of(context)!.register_as_student,
          ),
          SizedBox(height: 16.h),
          CustomRegisterButton(
            routeName: RegisterTeacherView.routeName,
            title: AppLocalizations.of(context)!.register_as_teacher,
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
