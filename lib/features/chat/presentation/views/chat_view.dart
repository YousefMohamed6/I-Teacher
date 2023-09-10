import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/constants/fonts.dart';
import 'package:mrjoo/features/chat/data/chat_cubit/chat_cubit.dart';
import 'package:mrjoo/features/chat/data/chat_cubit/chat_state.dart';
import 'package:mrjoo/core/utils/show_message.dart';
import 'package:mrjoo/features/chat/presentation/views/widgets/sign_out_button.dart';
import 'package:mrjoo/features/login/presentation/views/login_view.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/features/chat/presentation/views/widgets/chat_view_body.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          fontFamily: kPacificoFont,
        ),
        backgroundColor: kAppBarColor,
        actions: const [
          SignOutButton(),
        ],
      ),
      body: Background(
        child: BlocConsumer<ChatCubit, ChatState>(
          listener: (context, state) {
            if (state is SignOut) {
              ShowMessage.show(context, msg: 'Signout');
              Navigator.popAndPushNamed(context, LoginView.id);
            }
          },
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              );
            } else if (state is Success) {
              return ChatviewBody(
                messages: state.messages,
              );
            } else {
              return const Center(
                child: CustomText(
                  text: 'SomeThing Wrong',
                  fontSize: 24,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
