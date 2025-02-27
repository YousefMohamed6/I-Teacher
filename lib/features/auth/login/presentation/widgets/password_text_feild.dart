import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:mrjoo/features/auth/login/presentation/manager/login_state.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class PasswordTextFeild extends StatelessWidget {
  const PasswordTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<LoginCubit>(context).passwordKey,
      child: BlocBuilder<LoginCubit, LoginViewState>(
        builder: (context, state) => CustomFormField(
          lablelText: AppLocalizations.of(context)!.password,
          hintText: AppLocalizations.of(context)!.enter_password,
          textInputType: TextInputType.visiblePassword,
          suffixIcon: IconButton(
            onPressed: () {
              BlocProvider.of<LoginCubit>(context).changeObscureText();
            },
            icon: BlocProvider.of<LoginCubit>(context).obscuretext
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
          ),
          prefixIcon: const Icon(Icons.lock),
          obscureText: BlocProvider.of<LoginCubit>(context).obscuretext,
          controller: BlocProvider.of<LoginCubit>(context).password,
        ),
      ),
    );
  }
}
