import 'package:flutter/material.dart';
import 'package:mrjoo/core/widgets/app_drawer.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/student_data/presentation/widgets/student_view_body.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class StudentView extends StatelessWidget {
  const StudentView({super.key});
  static String routeName = '/StudentView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
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
