import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/widgets/custom_form_field.dart';
import 'package:iteacher/features/register_student/presentation/manager/register_student_cubit.dart';
import 'package:iteacher/generated/app_localizations.dart';

class AddressTextField extends StatelessWidget {
  const AddressTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.streetAddress,
      labelText: AppLocalizations.of(context)!.address,
      hintText: AppLocalizations.of(context)!.enter_address,
      prefixIcon: const Icon(Icons.directions_outlined),
      controller: BlocProvider.of<StudentCubit>(context).addressTextController,
    );
  }
}
