import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:mrjoo/features/auth/register/presentation/manager/register_state.dart';
import 'package:mrjoo/mr_joo.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<RegisterCubit>();
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) => CustomFormField(
        textInputType: TextInputType.visiblePassword,
        suffixIcon: IconButton(
          onPressed: () {
            cubit.changeObscureText();
          },
          icon: cubit.obscuretext
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
        ),
        prefixIcon: const Icon(Icons.security_outlined),
        lablelText: AppLocalizations.of(context)!.password,
        hintText: AppLocalizations.of(context)!.enter_password,
        obscureText: cubit.obscuretext,
        controller: cubit.passwordTextController,
      ),
    );
  }
}
