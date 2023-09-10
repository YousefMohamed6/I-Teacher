import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/customer/data/customer_cubit/customer_cubit.dart';

class CustomerFullName extends StatelessWidget {
  const CustomerFullName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomFormField(
            textInputType: TextInputType.name,
            hintText: 'First name',
            prefixIcon: const Icon(Icons.person),
            controller: BlocProvider.of<CustomerCubit>(context).fristName,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: CustomFormField(
            textInputType: TextInputType.name,
            hintText: 'Last name',
            prefixIcon: const Icon(Icons.person),
            controller: BlocProvider.of<CustomerCubit>(context).lastName,
          ),
        ),
      ],
    );
  }
}
