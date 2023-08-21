import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mrjoo/consts/colors.dart';
import 'package:mrjoo/consts/text.dart';
import 'package:mrjoo/cubits/chat/chat_cubit.dart';
import 'package:mrjoo/cubits/chat/chat_state.dart';
import 'package:mrjoo/widgets/background.dart';
import 'package:mrjoo/widgets/custom_chat_page.dart';
import 'package:mrjoo/widgets/custom_text.dart';
import 'package:mrjoo/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import '../services/google_services.dart';
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
              GoogleServices.signOut(context);
            },
          ),
        ],
        backgroundColor: kAppBarColor,
      ),
      body: BlocConsumer<ChatCubit, ChatState>(
        builder: (context, state) {
          if (state is ChatLoading) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            );
          } else if (state is ChatSuccess) {
            return StreamBuilder<QuerySnapshot>(
              stream: BlocProvider.of<ChatCubit>(context)
                  .reference
                  .orderBy(kCreatedAtField, descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  dynamic messages =
                      BlocProvider.of<ChatCubit>(context).messages;
                  return Background(
                    child: CustomChatPage(
                      messages: messages,
                      user: FirebaseAuth.instance.currentUser!,
                      formKey: BlocProvider.of<ChatCubit>(context).formKey,
                      scrollController: BlocProvider.of<ChatCubit>(context)
                          .scrollController,
                      controller:
                          BlocProvider.of<ChatCubit>(context).messageCtrl,
                      onFieldSubmitted: (message) {
                        BlocProvider.of<ChatCubit>(context).checkValidate();
                      },
                      onPressed: () {
                        BlocProvider.of<ChatCubit>(context).checkValidate();
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: CustomText(text: 'SomeThing Wrong'),
                  );
                }
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            );
          }
        },
        listener: (context, state) {
          BlocProvider.of<ChatCubit>(context).getMesssages(context);
        },
      ),
    );
  }
}
