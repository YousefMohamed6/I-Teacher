import 'package:flutter/material.dart';
import 'package:mrjoo/features/home/presentation/views/home_view.dart';
import 'package:mrjoo/features/splash/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static String id = 'SplashPage';
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
      Navigator.popAndPushNamed(context, HomeView.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SplashViewBody();
  }
}
