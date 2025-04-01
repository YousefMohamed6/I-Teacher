import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/widgets/custom_form_field.dart';
import 'package:iteacher/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';
import 'package:iteacher/generated/app_localizations.dart';

class DepartmentTextField extends StatelessWidget {
  const DepartmentTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      lablelText: AppLocalizations.of(context)!.department,
      hintText: AppLocalizations.of(context)!.department,
      textInputType: TextInputType.text,
      prefixIcon: const Icon(Icons.book_outlined),
      controller: BlocProvider.of<TeacherProfileCubit>(context)
          .departmentTextController,
    );
  }
}
