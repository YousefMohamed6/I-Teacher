import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/widgets/custom_form_field.dart';
import 'package:iteacher/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';
import 'package:iteacher/generated/app_localizations.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      lablelText: AppLocalizations.of(context)!.phone,
      hintText: AppLocalizations.of(context)!.enter_phone,
      textInputType: TextInputType.phone,
      prefixIcon: const Icon(Icons.call_outlined),
      controller:
          BlocProvider.of<TeacherProfileCubit>(context).phoneTextController,
    );
  }
}
