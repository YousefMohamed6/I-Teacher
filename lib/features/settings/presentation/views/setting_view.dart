import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/core/utils/constants/app_fonts.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/settings/presentation/widgets/setting_view_body.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class SettingsView extends StatelessWidget {
  static String routeName = '/Setting';
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: CustomText(
              text: AppLocalizations.of(context)!.settings,
              fontFamily: AppFonts.kPacificoFont,
              color: AppColors.kMainTextColor,
            ),
            centerTitle: true,
          ),
          body: SettingsViewBody()),
    );
  }
}
