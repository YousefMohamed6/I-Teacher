import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/core/utils/constants/app_fonts.dart';
import 'package:mrjoo/core/widgets/app_drawer.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/chat/presentation/views/chat_view.dart';
import 'package:mrjoo/features/course/presentation/widgets/course_view_body.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key});
  static String routeName = '/CourseView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title:  CustomText(
          text: AppLocalizations.of(context)!.course,
          fontSize: 24,
          fontFamily: AppFonts.kPacificoFont,
          color: Colors.white,
        ),
        backgroundColor: AppColors.kAppBarColor,
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(ChatView.routeName);
            },
            icon: const Icon(
              Icons.chat,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: const CourseViewBody(),
    );
  }
}
