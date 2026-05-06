import 'package:flutter/material.dart';
import 'package:iteacher/core/utils/constants/app_font_sizes.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/generated/app_localizations.dart';

class IAcceptText extends StatelessWidget {
  const IAcceptText({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: AppLocalizations.of(context)!.i_accept,
      fontSize: AppFontSizes.s14,
    );
  }
}
