import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mrjoo/core/enums/user_role.dart';
import 'package:mrjoo/core/services/sf_service.dart';
import 'package:mrjoo/core/utils/constants/app_images.dart';
import 'package:mrjoo/core/utils/constants/sf_keys.dart';
import 'package:mrjoo/core/widgets/asset_image.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/features/auth/login/presentation/views/login_view.dart';
import 'package:mrjoo/features/course/presentation/views/course_view.dart';
import 'package:mrjoo/features/teacher_profile/presentation/views/teacher_profile_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    handleNavigation();
    super.initState();
  }

  Future<void> handleNavigation() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () async {
        final User? user = FirebaseAuth.instance.currentUser;
        if (context.mounted) {
          if (user != null) {
            final userRole = await getUserRole();
            userRole == UserRole.student
                ? context.pushReplacementNamed(CourseView.routeName)
                : context.pushReplacementNamed(TeacherProfileView.routeName);
            return;
          }
          context.pushReplacementNamed(LoginView.routeName);
        }
      },
    );
  }

  Future<UserRole> getUserRole() async {
    final String userRole =
        await SharedPreferencesService.getString(SfKeys.userRole) ?? '';
    switch (userRole) {
      case 'teacher':
        return UserRole.teacher;
      default:
        return UserRole.student;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CustomAssetImage(
              imagePath: AppImages.kSplashLogo,
            ),
          )
        ],
      ),
    );
  }
}
