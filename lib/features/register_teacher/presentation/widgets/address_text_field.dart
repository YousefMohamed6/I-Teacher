import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/widgets/custom_form_field.dart';
import 'package:iteacher/features/register_teacher/presentation/manager/register_teacher_cubit.dart';
import 'package:iteacher/generated/app_localizations.dart';

class AddressTextField extends StatelessWidget {
  const AddressTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.streetAddress,
      prefixIcon: const Icon(Icons.location_on_outlined),
      lablelText: AppLocalizations.of(context)!.address,
      hintText: AppLocalizations.of(context)!.enter_address,
      controller:
          BlocProvider.of<RegisterTeacherCubit>(context).addressTextField,
    );
  }
}
