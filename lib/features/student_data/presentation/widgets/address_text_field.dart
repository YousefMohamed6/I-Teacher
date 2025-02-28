import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/student_data/presentation/manager/customer_cubit.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class AddressTextField extends StatelessWidget {
  const AddressTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.streetAddress,
      lablelText: AppLocalizations.of(context)!.address,
      hintText: AppLocalizations.of(context)!.enter_address,
      prefixIcon: const Icon(Icons.email),
      controller: BlocProvider.of<CustomerCubit>(context).address,
    );
  }
}
