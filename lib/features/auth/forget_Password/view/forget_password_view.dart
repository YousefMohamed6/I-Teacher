import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/constants/fonts.dart';
import 'package:mrjoo/core/utils/show_message.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/auth/forget_Password/forget_password_cubit/forget_password_cubit.dart';
import 'package:mrjoo/features/auth/forget_Password/view/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const String id = "/forgetpassword";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const CustomText(
            text: 'Forget Password',
            fontSize: 24,
            fontFamily: kPacificoFont,
            color: Colors.white,
          ),
          backgroundColor: kAppBarColor,
        ),
        body: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordSucess) {
              ShowMessage.show(context, msg: "Success check Gmail");
              Navigator.pop(context);
            }
            if (state is ForgetPasswordFailure) {
              ShowMessage.show(context, msg: state.errorMessage);
            }
          },
          child: const Background(child: ForgetPasswodBody()),
        ),
      ),
    );
  }
}
