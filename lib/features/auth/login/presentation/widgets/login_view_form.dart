import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
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
        padding: EdgeInsets.all(AppDimensions.kPadding16),
        children: [
          SizedBox(height: AppDimensions.kPadding24),
          Avatar(imagePath: AppImages.kAppLogo),
          SizedBox(height: AppDimensions.kPadding32),
          const EmailTextField(),
          SizedBox(height: AppDimensions.kPadding12),
          const PasswordTextField(),
          const ForgetPassword(),
          SizedBox(height: AppDimensions.kPadding24),
          const LoginButton(),
          SizedBox(height: AppDimensions.kPadding32),
          Divider(
            color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.2),
            indent: AppDimensions.kPadding32,
            endIndent: AppDimensions.kPadding32,
          ),
          SizedBox(height: AppDimensions.kPadding24),
          CustomRegisterButton(
            routeName: StudentView.routeName,
            title: AppLocalizations.of(context)!.register_as_student,
          ),
          SizedBox(height: AppDimensions.kPadding16),
          CustomRegisterButton(
            routeName: RegisterTeacherView.routeName,
            title: AppLocalizations.of(context)!.register_as_teacher,
          ),
          SizedBox(height: AppDimensions.kPadding24),
        ],
      ),
    );
  }
}
