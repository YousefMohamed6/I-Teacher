import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/widgets/custom_form_field.dart';
import 'package:iteacher/features/student_data/presentation/manager/student_cubit.dart';
import 'package:iteacher/generated/app_localizations.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.number,
      lablelText: AppLocalizations.of(context)!.phone,
      hintText: AppLocalizations.of(context)!.enter_phone,
      prefixIcon: const Icon(Icons.phone_outlined),
      controller: BlocProvider.of<StudentCubit>(context).phoneTextController,
    );
  }
}
