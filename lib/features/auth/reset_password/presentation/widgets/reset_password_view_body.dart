import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iteacher/core/utils/constants/app_images.dart';
import 'package:iteacher/core/utils/error_handler/auth_error_handler.dart';
import 'package:iteacher/core/utils/helper/toast_message.dart';
import 'package:iteacher/core/widgets/avatar.dart';
import 'package:iteacher/core/widgets/background.dart';
import 'package:iteacher/features/auth/reset_password/presentation/manager/reset_password_cubit.dart';
import 'package:iteacher/features/auth/reset_password/presentation/widgets/email_form_field.dart';
import 'package:iteacher/features/auth/reset_password/presentation/widgets/reset_password_button.dart';
import 'package:iteacher/generated/app_localizations.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is Success) {
          ToastMessage.show(msg: AppLocalizations.of(context)!.success);
          context.pop();
        }
        if (state is Failure) {
          final message = AuthErrorHandler.getErrorMessage(
              context: context, errorMessage: state.errorMessage);
          ToastMessage.show(msg: message);
        }
      },
      child: Background(
        child: Form(
          key: BlocProvider.of<ResetPasswordCubit>(context).formKey,
          child: ListView(
            children: [
              SizedBox(height: 84.h),
              Avatar(imagePath: AppImages.kAppLogo),
              SizedBox(height: 54.h),
              ResetPasswordEmailField(),
              SizedBox(height: 32.h),
              ResetPasswordButton(),
            ],
          ),
        ),
      ),
    );
  }
}
