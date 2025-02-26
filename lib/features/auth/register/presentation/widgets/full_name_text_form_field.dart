import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/auth/register/presentation/manager/register_cubit.dart';

class FullNametextFeild extends StatelessWidget {
  const FullNametextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.name,
      lablelText: 'Full Name',
      controller: BlocProvider.of<RegisterCubit>(context).displyName,
      prefixIcon: const Icon(Icons.account_circle),
    );
  }
}
