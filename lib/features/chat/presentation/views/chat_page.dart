import 'package:mrjoo/features/chat/data/chat_cubit/chat_cubit.dart';
import 'package:mrjoo/features/chat/data/chat_cubit/chat_state.dart';
import 'package:mrjoo/core/utils/show_message.dart';
import 'package:mrjoo/features/login/presentation/views/login_view.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/features/chat/presentation/views/widgets/custom_chat_page.dart';
import 'package:mrjoo/core/widgets/custom_icon_button.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static String id = "ChatPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Chat'),
        actions: [
          CustomIconButton(
            icon: const Icon(Icons.logout_outlined),
            iconSize: 40,
            onPressed: () {
              BlocProvider.of<ChatCubit>(context).signOut();
            },
          ),
        ],
      ),
      body: Background(
        child: BlocConsumer<ChatCubit, ChatState>(
          listener: (context, state) {
            if (state is SignOut) {
              ShowMessage.show(context, msg: 'LogOut');
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
              return CustomChatPage(
                messages: state.messages,
                formKey: BlocProvider.of<ChatCubit>(context).formKey,
                scrollController:
                    BlocProvider.of<ChatCubit>(context).scrollController,
                controller: BlocProvider.of<ChatCubit>(context).messageCtrl,
                onFieldSubmitted: (message) {
                  BlocProvider.of<ChatCubit>(context).sendMessage();
                },
                onPressed: () {
                  BlocProvider.of<ChatCubit>(context).sendMessage();
                },
              );
            } else {
              return const Center(
                child: CustomText(text: 'SomeThing Wrong'),
              );
            }
          },
        ),
      ),
    );
  }
}
