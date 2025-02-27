import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/core/utils/constants/app_fonts.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/chat/data/model/user_model.dart';
import 'package:mrjoo/features/course/presentation/widgets/action_buttons.dart';
import 'package:mrjoo/features/course/presentation/widgets/course_view_body.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key});
  static String routeView = 'CourseView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(
          text: 'Course',
          fontSize: 24,
          fontFamily: AppFonts.kPacificoFont,
          color: Colors.white,
        ),
        backgroundColor: AppColors.kAppBarColor,
        actions: [
          ActionButtons(
            user: UserModel(
              isAdmin: false,
              userId: FirebaseAuth.instance.currentUser?.uid ?? '',
              userName: FirebaseAuth.instance.currentUser?.displayName ?? '',
            ),
          ),
        ],
      ),
      body: const CourseViewBody(),
    );
  }
}
