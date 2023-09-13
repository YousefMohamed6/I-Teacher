import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/constants/fonts.dart';
import 'package:mrjoo/features/course/presentation/corse_view.dart';
import 'package:mrjoo/features/login/data/login-cubit/login_cubit.dart';
import 'package:mrjoo/features/login/data/login-cubit/login_state.dart';
import 'package:mrjoo/core/utils/show_message.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:mrjoo/features/login/presentation/views/widgets/login_view_body.dart';

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
          ),
          backgroundColor: kAppBarColor,
        ),
        body: Background(
          child: BlocConsumer<LoginViewCubit, LoginViewState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                ShowMessage.show(context, msg: 'Sign in');
                Navigator.popAndPushNamed(context, CourseView.id);
              }
              if (state is LoginFailure) {
                ShowMessage.show(context, msg: state.errMessage);
              }
              if (state is RestSuccess) {
                ShowMessage.show(context, msg: 'Success Check Gmail');
              }
              if (state is RestFailure) {
                ShowMessage.show(context, msg: 'Invalid Email');
              }
            },
            builder: (context, state) {
              if (state is LoginLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const LoginViewBody();
              }
            },
          ),
        ),
      ),
    );
  }
}
