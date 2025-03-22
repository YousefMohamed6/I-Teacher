import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/terms_and_conditions/presentation/views/terms_and_conditions.dart';
import 'package:iteacher/l10n.dart';

class TremsTextButton extends StatelessWidget {
  const TremsTextButton({super.key});

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
        fontSize: 14.sp,
      ),
    );
  }
}
