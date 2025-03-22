import 'package:flutter/material.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/terms_and_conditions/presentation/widgets/terms_and_conditions_body.dart';
import 'package:iteacher/l10n.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});
  static const String routeName = '/PrivacyAndPolicyView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.of(context)!.terms_and_conditions,
        ),
      ),
      body: const TermsAndConditionsBody(),
    );
  }
}
