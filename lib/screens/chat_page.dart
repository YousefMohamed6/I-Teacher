import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mrjoo/consts/colors.dart';
import 'package:mrjoo/consts/text.dart';
import 'package:mrjoo/cubits/chat/chat_cubit.dart';
import 'package:mrjoo/cubits/chat/chat_state.dart';
import 'package:mrjoo/helper/show_message.dart';
import 'package:mrjoo/models/message_model.dart';
import 'package:mrjoo/screens/login_page.dart';
import 'package:mrjoo/widgets/background.dart';
import 'package:mrjoo/widgets/custom_chat_page.dart';
import 'package:mrjoo/widgets/custom_text.dart';
import 'package:mrjoo/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static String id = "ChatPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Group Chat",
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        centerTitle: true,
        actions: [
          CustomTextButton(
            text: 'SignOut',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            onPressed: () {
              BlocProvider.of<ChatCubit>(context).signOut();
            },
          ),
        ],
        backgroundColor: kAppBarColor,
      ),
      body: Background(
        child: BlocConsumer<ChatCubit, ChatState>(
          listener: (context, state) {
            if (state is ChatLoading) {
              BlocProvider.of<ChatCubit>(context).getMessages();
            }
            if (state is ChatFailure) {
              ShowMessage.show(context, msg: 'Check internet connection');
            }
            if (state is SignOut) {
              ShowMessage.show(context, msg: 'LogOut');
              Navigator.popAndPushNamed(context, LoginPage.id);
            }
          },
          builder: (context, state) {
            if (state is ChatFailure) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              );
            } else if (state is ChatLoading) {
              return StreamBuilder<QuerySnapshot>(
                stream: BlocProvider.of<ChatCubit>(context)
                    .reference
                    .orderBy(kCreatedAtField, descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  var data = snapshot.data!.docs;
                  if (snapshot.hasData) {
                    List<MessageModel> messages = [];
                    for (int i = 0; i < data.length; ++i) {
                      messages.add(MessageModel.fromJsonData(data[i]));
                    }
                    BlocProvider.of<ChatCubit>(context).messages = messages;
                    return CustomChatPage(
                      messages: BlocProvider.of<ChatCubit>(context).messages!,
                      user: FirebaseAuth.instance.currentUser!,
                      formKey: BlocProvider.of<ChatCubit>(context).formKey,
                      scrollController:
                          BlocProvider.of<ChatCubit>(context).scrollController,
                      controller:
                          BlocProvider.of<ChatCubit>(context).messageCtrl,
                      onFieldSubmitted: (message) {
                        BlocProvider.of<ChatCubit>(context).checkValidate();
                      },
                      onPressed: () {
                        BlocProvider.of<ChatCubit>(context).checkValidate();
                      },
                    );
                  } else {
                    return const Center(
                      child: CustomText(
                        text: 'SomeThing Wrong',
                        color: kMainTextColor,
                      ),
                    );
                  }
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
