import 'package:flutter/material.dart';
import 'package:mrjoo/consts/images.dart';
import 'package:mrjoo/widgets/asset_image.dart';
import 'package:mrjoo/widgets/background.dart';
import 'package:mrjoo/screens/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static String id = 'SplashPage';
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigatortoHomepage();
  }

  Future<void> _navigatortoHomepage() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.popAndPushNamed(context, HomePage.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Background(),
        Center(
          child: CustomAssetImage(
            imagePath: kSplashLogo,
          ),
        )
      ],
    );
  }
}
