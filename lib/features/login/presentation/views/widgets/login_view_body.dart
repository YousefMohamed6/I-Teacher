import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/images.dart';
import 'package:mrjoo/core/widgets/avatar.dart';
import 'package:mrjoo/features/login/data/login-cubit/login_cubit.dart';
import 'package:mrjoo/features/login/data/login-cubit/login_state.dart';
import 'package:mrjoo/features/login/presentation/views/widgets/email_text_feild.dart';
import 'package:mrjoo/features/login/presentation/views/widgets/forget_password.dart';
import 'package:mrjoo/features/login/presentation/views/widgets/login_button.dart';
import 'package:mrjoo/features/login/presentation/views/widgets/password_text_feild.dart';
import 'package:mrjoo/features/login/presentation/views/widgets/register_now.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginViewCubit, LoginViewState>(
      builder: (context, state) => ListView(
        children: const [
          SizedBox(height: 48),
          Avatar(image: kAvaterLogo),
          SizedBox(height: 48),
          EmailTextFaild(),
          SizedBox(height: 16),
          PasswordTextFeild(),
          ForgetPassword(),
          SizedBox(height: 24),
          LoginButton(),
          SizedBox(height: 24),
          RegisterNow(),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
