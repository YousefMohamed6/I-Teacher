import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/constants/fonts.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/course/presentation/widgets/course_view_body.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(
          text: 'Course',
          fontSize: 24,
          fontFamily: kPacificoFont,
        ),
        backgroundColor: kAppBarColor,
      ),
      body: const CourseViewBody(url: ''),
    );
  }
}
