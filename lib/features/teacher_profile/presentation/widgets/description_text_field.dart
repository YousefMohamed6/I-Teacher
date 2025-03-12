import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_multi_line_text_field.dart';
import 'package:mrjoo/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class DescriptionTextField extends StatelessWidget {
  const DescriptionTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomMultiLineTextField(
      lablelText: AppLocalizations.of(context)!.course_description,
      hintText: AppLocalizations.of(context)!.course_description,
      prefixIcon: const Icon(Icons.description),
      controller: BlocProvider.of<TeacherProfileCubit>(context)
          .descriptionTextController,
    );
  }
}
