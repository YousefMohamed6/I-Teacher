import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/features/chat/presentation/widgets/chat_text_field.dart';
import 'package:mrjoo/features/chat/presentation/widgets/messages_view.dart';

class CustomChatView extends StatelessWidget {
  const CustomChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        spacing: 8.h,
        children: <Widget>[
          MessagesView(),
          CustomChatTextField(),
        ],
      ),
    );
  }
}
