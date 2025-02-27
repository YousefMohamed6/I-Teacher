import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mrjoo/core/widgets/language_text.dart';
import 'package:mrjoo/features/privacy_policey/presentation/views/privacy_and_policy.dart';

class LanguageMenu extends StatelessWidget {
  const LanguageMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'en',
          child: Text('English'),
        ),
        const PopupMenuItem(
          value: 'ar',
          child: Text('Arabic'),
        ),
      ],
      onSelected: (value) {
        context.pushNamed(PrivacyPolicyView.id);
      },
      child: const LanguageText(),
    );
  }
}
