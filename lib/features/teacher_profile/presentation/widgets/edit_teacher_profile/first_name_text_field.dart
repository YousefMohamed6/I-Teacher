import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/widgets/custom_form_field.dart';
import 'package:iteacher/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';
import 'package:iteacher/generated/app_localizations.dart';

class FirstNameTextField extends StatelessWidget {
  const FirstNameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.name,
      prefixIcon: const Icon(Icons.person_outline),
      lablelText: AppLocalizations.of(context)!.first_name,
      hintText: AppLocalizations.of(context)!.first_name,
      controller:
          BlocProvider.of<TeacherProfileCubit>(context).firstNameTextController,
    );
  }
}
