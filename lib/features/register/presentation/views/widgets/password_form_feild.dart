import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/register/data/register_cubit/register_cubit.dart';
import 'package:mrjoo/features/register/data/register_cubit/register_state.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterViewCubit, RegisterViewState>(
      builder: (context, state) => CustomFormField(
        textInputType: TextInputType.visiblePassword,
        suffixIcon: IconButton(
          onPressed: () {
            BlocProvider.of<RegisterViewCubit>(context).changeObscureText();
          },
          icon: BlocProvider.of<RegisterViewCubit>(context).obscuretext
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
        ),
        prefixIcon: const Icon(Icons.security_outlined),
        lablelText: "Password",
        hintText: "Enter Your Password",
        obscureText: BlocProvider.of<RegisterViewCubit>(context).obscuretext,
        controller: BlocProvider.of<RegisterViewCubit>(context).password,
      ),
    );
  }
}
