import 'package:flutter/material.dart';
import 'package:mrjoo/core/widgets/app_drawer.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/terms_and_conditions/presentation/widgets/terms_and_conditions_body.dart';
import 'package:mrjoo/mr_joo.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});
  static const String routeName = '/PrivacyAndPolicyView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.of(context)!.terms_and_conditions,
        ),
      ),
      body: const TermsAndConditionsBody(),
    );
  }
}
