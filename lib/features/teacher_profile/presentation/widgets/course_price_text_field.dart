import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class CoursePriceTextField extends StatelessWidget {
  const CoursePriceTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.number,
      prefixIcon: const Icon(
        FontAwesomeIcons.dollarSign,
      ),
      lablelText: AppLocalizations.of(context)!.course_price,
      hintText: AppLocalizations.of(context)!.course_price,
      controller: BlocProvider.of<TeacherProfileCubit>(context)
          .coursePriceTextController,
    );
  }
}
