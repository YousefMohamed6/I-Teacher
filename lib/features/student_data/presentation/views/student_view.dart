import 'package:flutter/material.dart';
import 'package:iteacher/core/widgets/background.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/student_data/presentation/widgets/student_view_body.dart';
import 'package:iteacher/generated/app_localizations.dart';

class StudentView extends StatelessWidget {
  const StudentView({super.key});
  static String routeName = '/StudentView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.of(context)!.student_data,
        ),
      ),
      body: const Background(
        child: StudentViewBody(),
      ),
    );
  }
}
