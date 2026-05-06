import 'package:flutter/material.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
import 'package:iteacher/core/widgets/background.dart';
import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/edit_teacher_profile/display_teacher_profile/profile_view_body.dart';
import 'package:iteacher/generated/app_localizations.dart';

class TeacherProfileView extends StatelessWidget {
  const TeacherProfileView({super.key, required this.teacher});
  static const String routeName = "/ProfileView";
  final TeacherModel teacher;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.teacher_profile),
      ),
      body: Background(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppDimensions.kPadding16),
          child: ProfileViewBody(
            teacherModel: teacher,
          ),
        ),
      ),
    );
  }
}
