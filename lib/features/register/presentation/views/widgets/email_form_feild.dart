import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/register/data/register_cubit/register_cubit.dart';

class EmailFormFeild extends StatelessWidget {
  const EmailFormFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.emailAddress,
      prefixIcon: const Icon(Icons.email_outlined),
      lablelText: "Email",
      hintText: "Enter Your Email",
      controller: BlocProvider.of<RegisterViewCubit>(context).email,
    );
  }
}
