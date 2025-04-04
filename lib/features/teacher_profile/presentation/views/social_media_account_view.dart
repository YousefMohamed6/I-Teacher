import 'package:flutter/material.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/delete_account_button.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/edit_social_account_from.dart';
import 'package:iteacher/generated/app_localizations.dart';

class SocialMediaAccountView extends StatelessWidget {
  const SocialMediaAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.of(context)!.social_account,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          DeleteAccountButton(),
        ],
      ),
      body: SocialMediaAccountForm(),
    );
  }
}
