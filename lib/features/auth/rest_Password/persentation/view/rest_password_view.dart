import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/core/utils/constants/app_fonts.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/auth/rest_Password/persentation/widgets/rest_password_view_body.dart';
import 'package:iteacher/generated/app_localizations.dart';

class RestPasswordView extends StatelessWidget {
  const RestPasswordView({super.key});
  static const String routeName = "/ForgetPassword";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.of(context)!.rest_password,
          fontSize: 20.sp,
          fontFamily: AppFonts.kPacificoFont,
          color: Colors.white,
        ),
      ),
      body: ForgetPasswodBody(),
    );
  }
}
