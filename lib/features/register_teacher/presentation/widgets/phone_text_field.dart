import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/widgets/custom_form_field.dart';
import 'package:iteacher/features/register_teacher/presentation/manager/register_teacher_cubit.dart';
import 'package:iteacher/generated/app_localizations.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.phone,
      prefixIcon: const Icon(Icons.phone_android_outlined),
      labelText: AppLocalizations.of(context)!.phone,
      hintText: AppLocalizations.of(context)!.enter_phone,
      controller:
          BlocProvider.of<RegisterTeacherCubit>(context).phoneTextController,
    );
  }
}
