import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/widgets/custom_form_field.dart';
import 'package:iteacher/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';
import 'package:iteacher/generated/app_localizations.dart';

class CourseLinkTextField extends StatelessWidget {
  const CourseLinkTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.url,
      prefixIcon: const Icon(Icons.link_outlined),
      lablelText: AppLocalizations.of(context)!.course_link,
      hintText: AppLocalizations.of(context)!.course_link,
      controller: BlocProvider.of<TeacherProfileCubit>(context)
          .courseLinkTextController,
    );
  }
}
