import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/student_data/presentation/manager/customer_cubit.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class FullNameTextFeild extends StatelessWidget {
  const FullNameTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomFormField(
            textInputType: TextInputType.name,
            hintText: AppLocalizations.of(context)!.frist_name,
            prefixIcon: const Icon(Icons.person),
            controller: BlocProvider.of<CustomerCubit>(context).fristName,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: CustomFormField(
            textInputType: TextInputType.name,
            hintText: AppLocalizations.of(context)!.last_name,
            prefixIcon: const Icon(Icons.person),
            controller: BlocProvider.of<CustomerCubit>(context).lastName,
          ),
        ),
      ],
    );
  }
}
