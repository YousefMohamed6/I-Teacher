import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/widgets/custom_form_field.dart';
import 'package:iteacher/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:iteacher/l10n.dart';

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
              ? const Icon(Icons.visibility_outlined)
              : const Icon(Icons.visibility_off_outlined),
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
