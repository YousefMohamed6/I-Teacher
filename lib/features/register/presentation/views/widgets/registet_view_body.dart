import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/images.dart';
import 'package:mrjoo/core/widgets/avatar.dart';
import 'package:mrjoo/features/register/data/register_cubit/register_cubit.dart';
import 'package:mrjoo/features/register/presentation/views/widgets/email_form_feild.dart';
import 'package:mrjoo/features/register/presentation/views/widgets/full_name_text_form_field.dart';
import 'package:mrjoo/features/register/presentation/views/widgets/password_form_feild.dart';
import 'package:mrjoo/features/register/presentation/views/widgets/register_button.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<RegisterViewCubit>(context).formKey,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Avatar(image: kAvaterLogo),
          SizedBox(height: 48),
          FullNametextFeild(),
          SizedBox(height: 8),
          EmailFormFeild(),
          SizedBox(height: 8),
          PasswordFormField(),
          SizedBox(height: 24),
          RegisterButton(),
        ],
      ),
    );
  }
}
