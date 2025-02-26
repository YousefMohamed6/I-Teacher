import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/show_message.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/features/course/data/course_view_cubit/course_view_cubit.dart';
import 'package:mrjoo/features/course/presentation/course_view.dart';
import 'package:mrjoo/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:mrjoo/features/auth/login/presentation/manager/login_state.dart';
import 'package:mrjoo/features/auth/login/presentation/widgets/login_view_body.dart';

class CheckUserLogin extends StatelessWidget {
  const CheckUserLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: BlocConsumer<LoginViewCubit, LoginViewState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            BlocProvider.of<CourseCubit>(context).fetchUrl();
            Navigator.pushReplacementNamed(context, CourseView.id);
            ShowMessage.show(context, msg: 'Sign in');
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
    );
  }
}