import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iteacher/core/utils/constants/app_font_sizes.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/terms_and_conditions/presentation/Screens/terms_and_conditions.dart';
import 'package:iteacher/generated/app_localizations.dart';

class TermsTextButton extends StatelessWidget {
  const TermsTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style:
          const ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero)),
      onPressed: () {
        context.pushNamed(TermsAndConditionsView.routeName);
      },
      child: CustomText(
        text: AppLocalizations.of(context)!.terms_and_conditions,
        fontSize: AppFontSizes.s14,
      ),
    );
  }
}
