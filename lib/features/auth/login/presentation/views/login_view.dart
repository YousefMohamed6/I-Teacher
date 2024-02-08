import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/constants/fonts.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/auth/login/data/login-cubit/login_cubit.dart';
import 'package:mrjoo/features/auth/login/presentation/views/widgets/check_user_login.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = "LoginView";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginViewCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const CustomText(
            text: 'Login',
            fontSize: 24,
            fontFamily: kPacificoFont,
            color: Colors.white,
          ),
          backgroundColor: kAppBarColor,
        ),
        body: const CheckUserLogin(),
      ),
    );
  }
}
