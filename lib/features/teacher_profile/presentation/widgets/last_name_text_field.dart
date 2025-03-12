import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class LastNameTextField extends StatelessWidget {
  const LastNameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.name,
      prefixIcon: const Icon(Icons.person_outline),
      lablelText: AppLocalizations.of(context)!.last_name,
      hintText: AppLocalizations.of(context)!.last_name,
      controller:
          BlocProvider.of<TeacherProfileCubit>(context).lastNameTextController,
    );
  }
}
