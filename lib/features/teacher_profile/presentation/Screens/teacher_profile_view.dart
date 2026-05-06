import 'package:flutter/material.dart';
import 'package:iteacher/core/utils/constants/app_fonts.dart';
import 'package:iteacher/core/widgets/background.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/edit_teacher_profile/display_teacher_profile/profile_view_body.dart';
import 'package:iteacher/generated/app_localizations.dart';

class TeacherProfileView extends StatelessWidget {
  const TeacherProfileView({super.key, required this.teacher});
  static const String routeName = "/ProfileView";
  final TeacherModel teacher;
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.of(context)!.i_teacher,
          fontSize: 24,
          fontFamily: AppFonts.kPacificoFont,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Background(
            child: ProfileViewBody(
              teacherModel: teacher,
            ),
          ),
        ],
      ),
    );
  }
}
