import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/app_fonts.dart';
import 'package:mrjoo/core/utils/constants/keys.dart';
import 'package:mrjoo/core/widgets/app_drawer.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/profile/presentation/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const String routeName = "/ProfileView";
  @override
  Widget build(context) {
    return Scaffold(
      drawer: CustomDrawer(),
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
