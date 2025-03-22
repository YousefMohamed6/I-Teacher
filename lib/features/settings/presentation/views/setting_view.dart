import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/core/utils/constants/app_fonts.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/settings/presentation/widgets/setting_view_body.dart';
import 'package:iteacher/generated/app_localizations.dart';

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
              fontSize: 20.sp,
            ),
          ),
          body: SettingsViewBody()),
    );
  }
}
