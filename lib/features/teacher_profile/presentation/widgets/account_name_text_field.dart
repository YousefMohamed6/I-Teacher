import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class AccountNameTextField extends StatelessWidget {
  const AccountNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.name,
      autovalidateMode: AutovalidateMode.disabled,
      prefixIcon: const Icon(Icons.text_fields),
      lablelText: AppLocalizations.of(context)!.account_name,
      hintText: AppLocalizations.of(context)!.account_name,
      controller: BlocProvider.of<TeacherProfileCubit>(context)
          .accountNameTextController,
    );
  }
}
