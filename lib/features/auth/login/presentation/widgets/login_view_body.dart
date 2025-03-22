import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iteacher/core/enums/user_role.dart';
import 'package:iteacher/core/exceptions/unfound_user.dart';
import 'package:iteacher/core/utils/error_handler/auth_error_handler.dart';
import 'package:iteacher/core/utils/helper/show_message.dart';
import 'package:iteacher/core/widgets/background.dart';
import 'package:iteacher/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:iteacher/features/auth/login/presentation/widgets/login_view_form.dart';
import 'package:iteacher/features/course/presentation/views/course_view.dart';
import 'package:iteacher/features/teacher_profile/presentation/views/teacher_profile_view.dart';
import 'package:iteacher/generated/app_localizations.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is Success<UserRole>) {
            state.data == UserRole.student
                ? context.pushReplacementNamed(CourseView.routeName)
                : context.pushReplacementNamed(TeacherProfileView.routeName);
          } else if (state is Failure<UnFoundUser>) {
            ShowMessage.show(context,
                msg: AppLocalizations.of(context)!.unfound_user);
          } else if (state is Failure) {
            final String message = AuthErrorHandler.getErrorMessage(
                context: context, errorMessage: state.errMessage);
            ShowMessage.show(context, msg: message);
          }
        },
        buildWhen: (previous, current) => current is UpdateUI,
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
