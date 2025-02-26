import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/widgets/language_menu.dart';
import 'package:mrjoo/features/terms/presentation/widgets/terms_condition_view_body.dart';

class TermsConditionsView extends StatelessWidget {
  const TermsConditionsView({super.key});
  static const String id = 'TermsAndConditionsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trems & Condition'),
        backgroundColor: kAppBarColor,
        actions: const [
          LanguageMenu(),
        ],
      ),
      body: const TermsConditionsBody(),
    );
  }
}
