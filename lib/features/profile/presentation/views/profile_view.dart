import 'package:flutter/material.dart';
import 'package:iteacher/core/utils/constants/app_fonts.dart';
import 'package:iteacher/core/utils/constants/keys.dart';
import 'package:iteacher/core/widgets/background.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/profile/presentation/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const String routeName = "/ProfileView";
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: AppKeys.kAppName,
          fontSize: 24,
          fontFamily: AppFonts.kPacificoFont,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: const [
          Background(
            child: ProfileViewBody(),
          ),
        ],
      ),
    );
  }
}
