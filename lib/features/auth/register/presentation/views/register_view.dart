import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/core/utils/constants/app_fonts.dart';
import 'package:mrjoo/core/widgets/app_drawer.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/auth/register/presentation/widgets/registet_view_body.dart';
import 'package:mrjoo/features/auth/register/presentation/widgets/sigin_with_google_button.dart';
import 'package:mrjoo/mr_joo.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String routeName = '/RegisterView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: AppLocalizations.of(context)!.register,
          fontSize: 20.sp,
          fontFamily: AppFonts.kPacificoFont,
          color: Colors.white,
        ),
        actions: const [
          SignWithGoogleButton(),
        ],
        backgroundColor: AppColors.kAppBarColor,
      ),
      body: const RegisterViewBody(),
    );
  }
}
