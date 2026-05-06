import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
import 'package:iteacher/core/utils/constants/app_images.dart';
import 'package:iteacher/core/widgets/avatar.dart';
import 'package:iteacher/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:iteacher/features/auth/register/presentation/widgets/accept_terms_row.dart';
import 'package:iteacher/features/auth/register/presentation/widgets/email_form_field.dart';
import 'package:iteacher/features/auth/register/presentation/widgets/first_name_form_field.dart';
import 'package:iteacher/features/auth/register/presentation/widgets/last_name_form_field.dart';
import 'package:iteacher/features/auth/register/presentation/widgets/password_form_field.dart';
import 'package:iteacher/features/auth/register/presentation/widgets/register_button.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<RegisterCubit>(context).formKey,
      child: ListView(
        padding: EdgeInsets.all(AppDimensions.kPadding16),
        children: [
          SizedBox(height: AppDimensions.kPadding16),
          const Avatar(imagePath: AppImages.kAppLogo),
          SizedBox(height: AppDimensions.kPadding24),
          const Row(
            children: [
              Expanded(child: FirstNameFormField()),
              Expanded(child: LastNameFormField()),
            ],
          ),
          const EmailFormField(),
          const PasswordFormField(),
          SizedBox(height: AppDimensions.kPadding8),
          const AcceptTermsRow(),
          SizedBox(height: AppDimensions.kPadding32),
          const RegisterButton(),
          SizedBox(height: AppDimensions.kPadding24),
        ],
      ),
    );
  }
}
