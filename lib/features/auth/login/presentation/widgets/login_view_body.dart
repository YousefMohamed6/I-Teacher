import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mrjoo/core/services/show_message.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:mrjoo/features/auth/login/presentation/manager/login_state.dart';
import 'package:mrjoo/features/auth/login/presentation/widgets/login_view_form.dart';
import 'package:mrjoo/features/course/presentation/views/course_view.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: BlocConsumer<LoginCubit, LoginViewState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            context.pushReplacementNamed(CourseView.routeName);
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
            return const LoginViewForm();
          }
        },
      ),
    );
  }
}
