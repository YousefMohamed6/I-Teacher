import 'package:flutter/material.dart';
import 'package:iteacher/core/utils/constants/app_font_sizes.dart';
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
          fontSize: AppFontSizes.s20,
          fontFamily: AppFonts.kPacificoFont,
        ),
      ),
      body: const ChatViewBody(),
    );
  }
}
