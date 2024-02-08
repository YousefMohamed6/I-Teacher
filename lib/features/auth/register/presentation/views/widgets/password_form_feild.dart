import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/auth/register/data/register_cubit/register_cubit.dart';
import 'package:mrjoo/features/auth/register/data/register_cubit/register_state.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) => CustomFormField(
        textInputType: TextInputType.visiblePassword,
        suffixIcon: IconButton(
          onPressed: () {
            BlocProvider.of<RegisterCubit>(context).changeObscureText();
          },
          icon: BlocProvider.of<RegisterCubit>(context).obscuretext
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
        ),
        prefixIcon: const Icon(Icons.security_outlined),
        lablelText: "Password",
        hintText: "Enter Your Password",
        obscureText: BlocProvider.of<RegisterCubit>(context).obscuretext,
        controller: BlocProvider.of<RegisterCubit>(context).password,
      ),
    );
  }
}
