import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/student_data/presentation/manager/student_cubit.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class FullNameTextField extends StatelessWidget {
  const FullNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomFormField(
            textInputType: TextInputType.name,
            lablelText: AppLocalizations.of(context)!.first_name,
            prefixIcon: const Icon(Icons.person_outline),
            controller:
                BlocProvider.of<StudentCubit>(context).firstNameTextController,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: CustomFormField(
            textInputType: TextInputType.name,
            lablelText: AppLocalizations.of(context)!.last_name,
            prefixIcon: const Icon(Icons.person_2_outlined),
            controller:
                BlocProvider.of<StudentCubit>(context).lastNameTextController,
          ),
        ),
      ],
    );
  }
}
