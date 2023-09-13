import 'package:hive_flutter/hive_flutter.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/constants/fonts.dart';
import 'package:mrjoo/core/utils/constants/text.dart';
import 'package:mrjoo/features/chat/data/chat_cubit/chat_cubit.dart';
import 'package:mrjoo/features/chat/data/chat_cubit/chat_state.dart';
import 'package:mrjoo/core/utils/show_message.dart';
import 'package:mrjoo/features/chat/data/model/message_model.dart';
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
              ShowMessage.show(context, msg: 'Sign out');
              Navigator.popAndPushNamed(context, LoginView.id);
            } else {
              BlocProvider.of<ChatCubit>(context).fetchFirebaseMessages();
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
              var messageBox = Hive.box<MessageModel>(kMessageBox);
              return ChatviewBody(
                messages: messageBox.values.toList(),
              );
            }
          },
        ),
      ),
    );
  }
}
