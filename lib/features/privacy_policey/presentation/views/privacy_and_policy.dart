import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/widgets/language_menu.dart';
import 'package:mrjoo/features/privacy_policey/presentation/widgets/privacy_and_policy_body.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});
  static const String id = 'PrivacyAndPolicyView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Privacy & Policy",
        ),
        backgroundColor: AppColors.kAppBarColor,
        actions: const [
          LanguageMenu(),
        ],
      ),
      body: const PrivacyAndPolicyBody(),
    );
  }
}
