import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mrjoo/core/services/show_message.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/core/utils/constants/app_fonts.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:mrjoo/features/auth/register/presentation/manager/register_state.dart';
import 'package:mrjoo/features/auth/register/presentation/widgets/registet_view_body.dart';
import 'package:mrjoo/features/auth/register/presentation/widgets/sigin_with_google_button.dart';
import 'package:mrjoo/features/course/presentation/views/course_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String id = 'RegisterView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          centerTitle: true,
          title: CustomText(
            text: "Register",
            fontSize: 20.sp,
            fontFamily: AppFonts.kPacificoFont,
            color: Colors.white,
          ),
          actions: const [
            SignWithGoogleButton(),
          ],
          backgroundColor: AppColors.kAppBarColor,
        ),
        body: Background(
          child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is Success) {
                ShowMessage.show(context, msg: 'Success');
                context.pushReplacementNamed(CourseView.routeName);
              } else if (state is Failure) {
                ShowMessage.show(context, msg: 'Sign Up is Faild');
              } else if (state is RegisterFailure) {
                ShowMessage.show(context, msg: state.errMessage);
              } else if (state is NotAcceptTermsAndPolicy) {
                ShowMessage.show(context, msg: 'Please Accept Trems & Policy');
              }
            },
            builder: (context, state) {
              if (state is Loading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const RegisterViewBody();
              }
            },
          ),
        ),
      ),
    );
  }
}
