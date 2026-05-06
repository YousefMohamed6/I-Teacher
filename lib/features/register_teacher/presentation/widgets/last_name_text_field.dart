import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/widgets/custom_form_field.dart';
import 'package:iteacher/features/register_teacher/presentation/manager/register_teacher_cubit.dart';
import 'package:iteacher/generated/app_localizations.dart';

class LastNameTextField extends StatelessWidget {
  const LastNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomFormField(
        textInputType: TextInputType.name,
        prefixIcon: const Icon(Icons.person_outline),
        labelText: AppLocalizations.of(context)!.last_name,
        hintText: AppLocalizations.of(context)!.last_name,
        controller:
            BlocProvider.of<RegisterTeacherCubit>(context).lastNameTextController,
      ),
    );
  }
}
