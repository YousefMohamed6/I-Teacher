import 'package:flutter/material.dart';
import 'package:iteacher/core/utils/constants/app_font_sizes.dart';
import 'package:iteacher/core/utils/constants/app_fonts.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/auth/register/presentation/widgets/registet_view_body.dart';
import 'package:iteacher/generated/app_localizations.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String routeName = '/RegisterView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.of(context)!.register,
          fontSize: AppFontSizes.s20,
          fontFamily: AppFonts.kPacificoFont,
        ),
      ),
      body: const RegisterViewBody(),
    );
  }
}
