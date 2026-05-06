import 'package:flutter/material.dart';
import 'package:iteacher/features/register_teacher/presentation/widgets/register_teacher_view_body.dart';
import 'package:iteacher/generated/app_localizations.dart';

class RegisterTeacherView extends StatelessWidget {
  const RegisterTeacherView({super.key});
  static const String routeName = '/registerTeacherView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.register_as_teacher),
      ),
      body: const RegisterTeacherViewBody(),
    );
  }
}
