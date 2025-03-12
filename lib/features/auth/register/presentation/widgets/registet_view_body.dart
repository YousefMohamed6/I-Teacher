import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mrjoo/core/exceptions/accept_terms_exception.dart';
import 'package:mrjoo/core/utils/constants/app_images.dart';
import 'package:mrjoo/core/utils/helper/show_message.dart';
import 'package:mrjoo/core/widgets/avatar.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:mrjoo/features/auth/register/presentation/widgets/accept_terms_row.dart';
import 'package:mrjoo/features/auth/register/presentation/widgets/email_form_field.dart';
import 'package:mrjoo/features/auth/register/presentation/widgets/password_form_field.dart';
import 'package:mrjoo/features/auth/register/presentation/widgets/register_button.dart';
import 'package:mrjoo/features/course/presentation/views/course_view.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is Success<bool> && state.data) {
            ShowMessage.show(context,
                msg: AppLocalizations.of(context)!.success);
            context.pushReplacementNamed(CourseView.routeName);
          } else if (state is Failure<String>) {
            ShowMessage.show(context, msg: AppLocalizations.of(context)!.fail);
          } else if (state is Failure<AcceptTermsException>) {
            ShowMessage.show(context,
                msg: AppLocalizations.of(context)!.must_accept_terms);
          }
        },
        buildWhen: (previous, current) => current is UpdateUI,
        builder: (context, state) {
          if (state is Loading<bool>) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Form(
              key: BlocProvider.of<RegisterCubit>(context).formKey,
              child: ListView(
                children: [
                  SizedBox(height: 32.h),
                  Avatar(imagePath: AppImages.kAvaterLogo),
                  SizedBox(height: 32.h),
                  EmailFormField(),
                  SizedBox(height: 16.h),
                  PasswordFormField(),
                  SizedBox(height: 16.h),
                  AcceptTermsRow(),
                  SizedBox(height: 24.h),
                  RegisterButton(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
