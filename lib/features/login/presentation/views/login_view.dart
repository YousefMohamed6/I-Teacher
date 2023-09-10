import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/features/chat/data/chat_cubit/chat_cubit.dart';
import 'package:mrjoo/features/login/data/login-cubit/login_cubit.dart';
import 'package:mrjoo/features/login/data/login-cubit/login_state.dart';
import 'package:mrjoo/core/utils/show_message.dart';
import 'package:mrjoo/features/chat/presentation/views/chat_page.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:mrjoo/features/login/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = "LoginView";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginViewCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const CustomText(text: 'Login'),
          backgroundColor: kAppBarColor,
        ),
        body: Background(
          child: BlocConsumer<LoginViewCubit, LoginViewState>(
            listener: (context, state) {
              if (state is LoginLoading) {
              } else if (state is LoginSuccess) {
                ShowMessage.show(context, msg: 'Login');
                BlocProvider.of<ChatCubit>(context).getMessages();
                Navigator.popAndPushNamed(context, ChatPage.id);
              } else if (state is LoginFialure) {
                ShowMessage.show(
                  context,
                  msg: state.errMessage,
                );
              }
              if (state is RestSuccess) {
                ShowMessage.show(
                  context,
                  msg: 'Success Check Gmail',
                );
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
        ),
      ),
    );
  }
}
