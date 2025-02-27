import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/services/show_message.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/core/utils/constants/app_fonts.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/auth/login/presentation/views/login_view.dart';
import 'package:mrjoo/features/chat/presentation/manager/chat_cubit.dart';
import 'package:mrjoo/features/chat/presentation/widgets/chat_view_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});
  static String id = "ChatPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(
          text: 'Group Chat',
          fontSize: 24,
          fontFamily: AppFonts.kPacificoFont,
          color: Colors.white,
        ),
        backgroundColor: AppColors.kAppBarColor,
      ),
      body: Background(
        child: BlocConsumer<ChatCubit, ChatState>(
          listener: (context, state) {
            if (state is SignOut) {
              ShowMessage.show(context, msg: 'Sign out');
              Navigator.pushReplacementNamed(context, LoginView.routeName);
            }
          },
          builder: (context, state) {
            if (state is Failure) {
              return const Center(
                child: CustomText(
                  text: 'SomeThing Wrong',
                  fontSize: 24,
                  color: Colors.white,
                ),
              );
            } else if (state is Success) {
              return ChatviewBody(
                messages: state.messages,
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
