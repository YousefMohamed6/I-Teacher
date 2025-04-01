import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/core/utils/constants/app_fonts.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/chat/presentation/widgets/chat_view_body.dart';
import 'package:iteacher/generated/app_localizations.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});
  static String routeName = "/ChatPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.of(context)!.chat,
          fontSize: 20.sp,
          fontFamily: AppFonts.kPacificoFont,
          color: Colors.white,
        ),
      ),
      body: ChatviewBody(),
    );
  }
}
