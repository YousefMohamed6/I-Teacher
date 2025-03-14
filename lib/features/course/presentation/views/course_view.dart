import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/app_fonts.dart';
import 'package:mrjoo/core/widgets/app_drawer.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/course/presentation/widgets/course_view_body.dart';
import 'package:mrjoo/features/course/presentation/widgets/navigate_to_chat_button.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key});
  static String routeName = '/CourseView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.of(context)!.course,
          fontSize: 24,
          fontFamily: AppFonts.kPacificoFont,
          color: Colors.white,
        ),
        actions: [
          NavigateToChatButton(),
        ],
      ),
      body: const CourseViewBody(),
    );
  }
}
