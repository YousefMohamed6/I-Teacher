import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:mrjoo/features/auth/login/presentation/manager/login_state.dart';

class PasswordTextFeild extends StatelessWidget {
  const PasswordTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<LoginViewCubit>(context).passwordKey,
      child: BlocBuilder<LoginViewCubit,LoginViewState>(
        builder: (context, state) => CustomFormField(
          lablelText: "Password",
          hintText: "Enter your Password",
          textInputType: TextInputType.visiblePassword,
          suffixIcon: IconButton(
            onPressed: () {
              BlocProvider.of<LoginViewCubit>(context).changeObscureText();
            },
            icon: BlocProvider.of<LoginViewCubit>(context).obscuretext
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
          ),
          prefixIcon: const Icon(Icons.lock),
          obscureText: BlocProvider.of<LoginViewCubit>(context).obscuretext,
          controller: BlocProvider.of<LoginViewCubit>(context).password,
        ),
      ),
    );
  }
}
