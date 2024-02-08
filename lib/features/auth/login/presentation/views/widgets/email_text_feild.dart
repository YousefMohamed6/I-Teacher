import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/auth/login/data/login-cubit/login_cubit.dart';

class EmailTextFaild extends StatelessWidget {
  const EmailTextFaild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<LoginViewCubit>(context).emailkey,
      child: CustomFormField(
        textInputType: TextInputType.emailAddress,
        prefixIcon: const Icon(Icons.email),
        lablelText: "Email",
        hintText: "Enter Your Email",
        controller: BlocProvider.of<LoginViewCubit>(context).email,
      ),
    );
  }
}
