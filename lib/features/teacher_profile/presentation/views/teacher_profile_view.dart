import 'package:flutter/material.dart';
import 'package:iteacher/core/widgets/custom_drawer.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/save_button.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/teacher_profile_body.dart';
import 'package:iteacher/generated/app_localizations.dart';

class TeacherProfileView extends StatelessWidget {
  const TeacherProfileView({super.key});
  static const String routeName = '/TeacherProfile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: CustomText(text: AppLocalizations.of(context)!.teacherProfile),
        actions: [
          SaveButton(),
        ],
      ),
      body: TeacherProfileBody(),
    );
  }
}
