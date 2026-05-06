import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/widgets/custom_form_field.dart';
import 'package:iteacher/features/register_student/presentation/manager/register_student_cubit.dart';
import 'package:iteacher/generated/app_localizations.dart';

class TeacherIdTextField extends StatelessWidget {
  const TeacherIdTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.streetAddress,
      labelText: AppLocalizations.of(context)!.teacher_id,
      hintText: AppLocalizations.of(context)!.enter_teacher_id,
      prefixIcon: const Icon(Icons.info_outline),
      controller:
          BlocProvider.of<StudentCubit>(context).teacherIdTextController,
    );
  }
}
