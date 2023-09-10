import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/customer/data/customer_cubit/customer_cubit.dart';

class EmailTextFeild extends StatelessWidget {
  const EmailTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.emailAddress,
      hintText: 'Email',
      prefixIcon: const Icon(Icons.email),
      controller: BlocProvider.of<CustomerCubit>(context).email,
    );
  }
}
