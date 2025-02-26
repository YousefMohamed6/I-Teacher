import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/customer/presentation/manager/customer_cubit.dart';

class PhoneTextFeild extends StatelessWidget {
  const PhoneTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.number,
      hintText: 'Phone',
      prefixIcon: const Icon(Icons.phone),
      controller: BlocProvider.of<CustomerCubit>(context).phone,
    );
  }
}