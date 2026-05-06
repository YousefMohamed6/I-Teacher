import 'package:flutter/material.dart';
import 'package:iteacher/core/utils/constants/app_fonts.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/course/presentation/widgets/course_view_body.dart';
import 'package:iteacher/features/settings/presentation/Screens/setting_view.dart';
import 'package:iteacher/generated/app_localizations.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key});
  static String routeName = '/CourseView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: SettingsView(),
      ),
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.of(context)!.course,
          fontSize: 24,
          fontFamily: AppFonts.kPacificoFont,
          color: Colors.white,
        ),
      ),
      body: const CourseViewBody(),
    );
  }
}
