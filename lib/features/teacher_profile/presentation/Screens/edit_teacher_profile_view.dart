import 'package:flutter/material.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/settings/presentation/Screens/default_setting_view.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/edit_teacher_profile/save_button.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/edit_teacher_profile/teacher_profile_body.dart';
import 'package:iteacher/generated/app_localizations.dart';

class EditTeacherProfileView extends StatelessWidget {
  const EditTeacherProfileView({super.key});
  static const String routeName = '/TeacherProfile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DefaultSettingsView(),
      ),
      appBar: AppBar(
        title: CustomText(
          color: Theme.of(context).colorScheme.onPrimary,
          text: AppLocalizations.of(context)!.teacherProfile,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          SaveButton(),
        ],
      ),
      body: TeacherProfileBody(),
    );
  }
}
