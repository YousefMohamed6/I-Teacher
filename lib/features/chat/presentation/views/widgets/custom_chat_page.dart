import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/time.dart';
import 'package:mrjoo/features/chat/presentation/views/widgets/chat_bubble.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';

class CustomChatPage extends StatelessWidget {
  const CustomChatPage({
    super.key,
    required this.messages,
    required this.scrollController,
    required this.controller,
    required this.onFieldSubmitted,
    required this.onPressed,
    required this.formKey,
  });

  final List messages;

  final ScrollController scrollController;
  final TextEditingController controller;
  final void Function(String?) onFieldSubmitted;
  final void Function() onPressed;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            reverse: true,
            controller: scrollController,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final user = FirebaseAuth.instance.currentUser;
              Time time = Time(index: index, messagesList: messages);
              if (user!.uid == messages[index].id) {
                return ChatBubble(
                  fullName: user.displayName!,
                  bubbleColor: kUserColor,
                  bottonLeftRedius: 24.0,
                  bottonRightRedius: 0.0,
                  message: messages[index].message,
                  time: '${time.hour()} : ${time.minute()} ${time.state()}',
                  alignmentMessage: Alignment.topRight,
                );
              } else {
                return ChatBubble(
                  fullName: messages[index].displayName,
                  bubbleColor: kFriendColor,
                  bottonLeftRedius: 0.0,
                  bottonRightRedius: 24.0,
                  message: messages[index].message,
                  time: '${time.hour()} : ${time.minute()} ${time.state()}',
                  alignmentMessage: Alignment.topLeft,
                );
              }
            },
          ),
        ),
        Form(
          key: formKey,
          child: CustomFormField(
            autovalidateMode: AutovalidateMode.disabled,
            controller: controller,
            hintText: 'Send',
            onFieldSubmitted: onFieldSubmitted,
            suffixIcon: MaterialButton(
              minWidth: 16,
              onPressed: onPressed,
              child: const Icon(
                Icons.send_sharp,
                color: kMainTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
