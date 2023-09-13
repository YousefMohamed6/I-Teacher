import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/constants/fonts.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/course/data/course_view_cubit/course_view_cubit.dart';
import 'package:mrjoo/features/course/presentation/widgets/admin_button.dart';
import 'package:mrjoo/features/course/presentation/widgets/course_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key});
  static String id = 'CourseView';
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
        actions: const [
          AdminButton(),
        ],
      ),
      body: CourseViewBody(
        url: BlocProvider.of<CourseCubit>(context).url,
      ),
    );
  }
}
