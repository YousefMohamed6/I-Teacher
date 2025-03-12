import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) => CustomFormField(
        lablelText: AppLocalizations.of(context)!.password,
        hintText: AppLocalizations.of(context)!.enter_password,
        textInputType: TextInputType.visiblePassword,
        suffixIcon: IconButton(
          onPressed: () {
            BlocProvider.of<LoginCubit>(context).changeObscureText();
          },
          icon: BlocProvider.of<LoginCubit>(context).obscuretext
              ? const Icon(Icons.visibility_outlined)
              : const Icon(Icons.visibility_off_outlined),
        ),
        prefixIcon: const Icon(Icons.lock_outline),
        obscureText: BlocProvider.of<LoginCubit>(context).obscuretext,
        controller: BlocProvider.of<LoginCubit>(context).passwordTextControlle,
      ),
    );
  }
}
