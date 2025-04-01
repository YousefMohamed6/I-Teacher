import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/widgets/custom_form_field.dart';
import 'package:iteacher/features/student_data/presentation/manager/student_cubit.dart';
import 'package:iteacher/generated/app_localizations.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.emailAddress,
      lablelText: AppLocalizations.of(context)!.email,
      hintText: AppLocalizations.of(context)!.enter_email,
      prefixIcon: const Icon(Icons.email_outlined),
      controller: BlocProvider.of<StudentCubit>(context).emailTextController,
    );
  }
}
