import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/student_data/presentation/manager/customer_cubit.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class PhoneTextFeild extends StatelessWidget {
  const PhoneTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.number,
      lablelText: AppLocalizations.of(context)!.phone,
      hintText: AppLocalizations.of(context)!.phone,
      prefixIcon: const Icon(Icons.phone),
      controller: BlocProvider.of<CustomerCubit>(context).phone,
    );
  }
}
