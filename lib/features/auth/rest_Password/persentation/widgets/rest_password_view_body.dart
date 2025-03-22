import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iteacher/core/utils/error_handler/auth_error_handler.dart';
import 'package:iteacher/core/utils/helper/show_message.dart';
import 'package:iteacher/core/utils/constants/app_images.dart';
import 'package:iteacher/core/widgets/avatar.dart';
import 'package:iteacher/core/widgets/background.dart';
import 'package:iteacher/features/auth/rest_Password/persentation/manager/rest_password_cubit.dart';
import 'package:iteacher/features/auth/rest_Password/persentation/widgets/email_form_feild.dart';
import 'package:iteacher/features/auth/rest_Password/persentation/widgets/rest_password_button.dart';
import 'package:iteacher/generated/app_localizations.dart';

class ForgetPasswodBody extends StatelessWidget {
  const ForgetPasswodBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RestPasswordCubit, RestPasswordState>(
      listener: (context, state) {
        if (state is Success) {
          ShowMessage.show(context, msg: AppLocalizations.of(context)!.success);
          context.pop();
        }
        if (state is Failure) {
          final message = AuthErrorHandler.getErrorMessage(
              context: context, errorMessage: state.errorMessage);
          ShowMessage.show(context, msg: message);
        }
      },
      child: Background(
        child: Form(
          key: BlocProvider.of<RestPasswordCubit>(context).formKey,
          child: ListView(
            children: [
              SizedBox(height: 84.h),
              Avatar(imagePath: AppImages.kAppLogo),
              SizedBox(height: 54.h),
              RestPasswordEmailFeild(),
              SizedBox(height: 32.h),
              RestPasswordButtom(),
            ],
          ),
        ),
      ),
    );
  }
}
