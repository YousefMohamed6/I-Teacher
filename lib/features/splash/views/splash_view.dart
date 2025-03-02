import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mrjoo/features/auth/login/presentation/views/login_view.dart';
import 'package:mrjoo/features/auth/register/presentation/views/register_view.dart';
import 'package:mrjoo/features/course/presentation/views/course_view.dart';
import 'package:mrjoo/features/splash/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static String path = '/';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigatortoHomepage();
  }

  Future<void> _navigatortoHomepage() async {
    await Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        final User? user = FirebaseAuth.instance.currentUser;
        user != null
            ? context.pushReplacementNamed(CourseView.routeName)
            : context.pushReplacementNamed(RegisterView.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SplashViewBody();
  }
}
