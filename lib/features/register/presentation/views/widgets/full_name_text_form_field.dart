import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/register/data/register_cubit/register_cubit.dart';

class FullNametextFeild extends StatelessWidget {
  const FullNametextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.name,
      lablelText: 'Full Name',
      controller: BlocProvider.of<RegisterViewCubit>(context).displyName,
      prefixIcon: const Icon(Icons.account_circle),
    );
  }
}
