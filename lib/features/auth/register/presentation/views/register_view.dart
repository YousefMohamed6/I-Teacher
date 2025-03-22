import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/core/utils/constants/app_fonts.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/auth/register/presentation/widgets/registet_view_body.dart';
import 'package:iteacher/features/auth/register/presentation/widgets/sigin_with_google_button.dart';
import 'package:iteacher/l10n.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String routeName = '/RegisterView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.of(context)!.register,
          fontSize: 20.sp,
          fontFamily: AppFonts.kPacificoFont,
          color: Colors.white,
        ),
        actions: const [
          SignWithGoogleButton(),
        ],
      ),
      body: const RegisterViewBody(),
    );
  }
}
