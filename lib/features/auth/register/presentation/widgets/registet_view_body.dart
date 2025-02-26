import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/images.dart';
import 'package:mrjoo/core/widgets/avatar.dart';
import 'package:mrjoo/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:mrjoo/features/auth/register/presentation/widgets/accept_terms_row.dart';
import 'package:mrjoo/features/auth/register/presentation/widgets/email_form_feild.dart';
import 'package:mrjoo/features/auth/register/presentation/widgets/full_name_text_form_field.dart';
import 'package:mrjoo/features/auth/register/presentation/widgets/password_form_feild.dart';
import 'package:mrjoo/features/auth/register/presentation/widgets/register_button.dart';
import 'package:mrjoo/features/auth/register/presentation/widgets/sigin_row.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<RegisterCubit>(context).formKey,
      child: ListView(
        children: const [
          SizedBox(height: 32),
          Avatar(image: AppImages.kAvaterLogo),
          SizedBox(height: 32),
          FullNametextFeild(),
          SizedBox(height: 8),
          EmailFormFeild(),
          SizedBox(height: 8),
          PasswordFormField(),
          SizedBox(height: 8),
          AcceptTermsRow(),
          SizedBox(height: 24),
          RegisterButton(),
          SizedBox(height: 4),
          SignInRow(),
        ],
      ),
    );
  }
}
