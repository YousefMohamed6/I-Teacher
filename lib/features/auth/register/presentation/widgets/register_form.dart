import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/core/utils/constants/app_images.dart';
import 'package:iteacher/core/widgets/avatar.dart';
import 'package:iteacher/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:iteacher/features/auth/register/presentation/widgets/accept_terms_row.dart';
import 'package:iteacher/features/auth/register/presentation/widgets/email_form_field.dart';
import 'package:iteacher/features/auth/register/presentation/widgets/first_name_form_field.dart';
import 'package:iteacher/features/auth/register/presentation/widgets/last_name_form_field.dart';
import 'package:iteacher/features/auth/register/presentation/widgets/password_form_field.dart';
import 'package:iteacher/features/auth/register/presentation/widgets/register_button.dart';

class RegistetForm extends StatelessWidget {
  const RegistetForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<RegisterCubit>(context).formKey,
      child: ListView(
        children: [
          SizedBox(height: 16.h),
          Avatar(imagePath: AppImages.kAppLogo),
          SizedBox(height: 16.h),
          Row(
            children: [
              FirstNameFormField(),
              LastNameFormField(),
            ],
          ),
          EmailFormField(),
          PasswordFormField(),
          SizedBox(height: 4.h),
          AcceptTermsRow(),
          SizedBox(height: 24.h),
          RegisterButton(),
        ],
      ),
    );
  }
}
