import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mrjoo/core/utils/constants/app_images.dart';
import 'package:mrjoo/core/widgets/asset_image.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/features/auth/login/presentation/views/login_view.dart';
import 'package:mrjoo/features/course/presentation/views/course_view.dart';

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
    await Future.delayed(const Duration(seconds: 2), () {
      final User? user = FirebaseAuth.instance.currentUser;
      if (context.mounted) {
        user != null
            ? context.pushReplacementNamed(CourseView.routeName)
            : context.pushReplacementNamed(LoginView.routeName);
      }
    });
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
