import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/core/utils/constants/app_fonts.dart';
import 'package:mrjoo/core/widgets/app_drawer.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/auth/login/presentation/widgets/login_view_body.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String routeName = "/LoginView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: AppLocalizations.of(context)!.login,
          fontSize: 20.sp,
          fontFamily: AppFonts.kPacificoFont,
          color: AppColors.kMainTextColor,
        ),
        backgroundColor: AppColors.kAppBarColor,
      ),
      body: const LoginViewBody(),
    );
  }
}
