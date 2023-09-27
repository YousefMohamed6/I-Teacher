import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_text_button.dart';
import 'package:mrjoo/features/login/data/login-cubit/login_cubit.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomTextButton(
          text: 'Forget Your Password',
          fontWeight: FontWeight.bold,
          onPressed: () async {
            var formkey = BlocProvider.of<LoginViewCubit>(context).emailkey;
            if (formkey.currentState!.validate()) {
              BlocProvider.of<LoginViewCubit>(context).sendRestPasswordLink();
            }
          },
        ),
      ],
    );
  }
}
