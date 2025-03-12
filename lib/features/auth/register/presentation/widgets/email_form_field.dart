import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:mrjoo/mr_joo.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.emailAddress,
      prefixIcon: const Icon(Icons.email_outlined),
      lablelText: AppLocalizations.of(context)!.email,
      hintText: AppLocalizations.of(context)!.enter_email,
      controller: BlocProvider.of<RegisterCubit>(context).emailTextController,
    );
  }
}
