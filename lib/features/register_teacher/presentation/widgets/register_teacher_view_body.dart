import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iteacher/core/utils/helper/toast_message.dart';
import 'package:iteacher/core/widgets/background.dart';
import 'package:iteacher/core/widgets/webview_body.dart';
import 'package:iteacher/features/auth/login/presentation/Screens/login_view.dart';
import 'package:iteacher/features/register_teacher/presentation/manager/register_teacher_cubit.dart';
import 'package:iteacher/features/register_teacher/presentation/widgets/register_teacher_form.dart';
import 'package:iteacher/generated/app_localizations.dart';

class RegisterTeacherViewBody extends StatelessWidget {
  const RegisterTeacherViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: BlocConsumer<RegisterTeacherCubit, RegisterTeacherState>(
        listener: (context, state) {
          if (state is Success && state.data == true) {
            context.goNamed(LoginView.routeName);
            ToastMessage.show(msg: AppLocalizations.of(context)!.success);
          }
        },
        buildWhen: (previous, current) =>
            current is Loading || current is Success<String> || current is UpdateUI,
        builder: (context, state) {
          return state.when(
            initial: () => const RegisterTeacherForm(),
            updateUI: () => const RegisterTeacherForm(),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (data) {
              return WebViewBody(
                url: data,
                onUrlChange: context.read<RegisterTeacherCubit>().checkPayment,
              );
            },
            error: (message) => Center(
              child: Text(
                message,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}
