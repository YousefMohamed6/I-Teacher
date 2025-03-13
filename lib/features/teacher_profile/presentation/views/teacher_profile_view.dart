import 'package:flutter/material.dart';
import 'package:mrjoo/core/widgets/app_drawer.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/teacher_profile/presentation/widgets/add_account_button.dart';
import 'package:mrjoo/features/teacher_profile/presentation/widgets/save_button.dart';
import 'package:mrjoo/features/teacher_profile/presentation/widgets/teacher_profile_body.dart';
import 'package:mrjoo/generated/app_localizations.dart';

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
          AddAccountButton(),
          SaveButton(),
        ],
      ),
      body: TeacherProfileBody(),
    );
  }
}
