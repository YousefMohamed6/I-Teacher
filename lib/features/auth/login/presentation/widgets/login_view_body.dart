import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mrjoo/core/error_handler/auth_error_handler.dart';
import 'package:mrjoo/core/services/show_message.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:mrjoo/features/auth/login/presentation/widgets/login_view_form.dart';
import 'package:mrjoo/features/course/presentation/views/course_view.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is Success<bool> && state.data) {
            context.pushReplacementNamed(CourseView.routeName);
            ShowMessage.show(context,
                msg: AppLocalizations.of(context)!.success);
          } else if (state is Failure) {
            final message = AuthErrorHandler.getErrorMessage(
                context: context, errorMessage: state.errMessage);
            ShowMessage.show(context, msg: message);
          }
        },
        buildWhen: (previous, current) =>
            current is UpdateUI || current is Loading,
        builder: (context, state) {
          if (state is Loading) {
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
