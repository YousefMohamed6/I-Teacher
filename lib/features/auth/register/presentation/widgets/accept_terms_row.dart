import 'package:flutter/material.dart';
import 'package:mrjoo/features/auth/register/presentation/widgets/accpet_icon.dart';
import 'package:mrjoo/features/auth/register/presentation/widgets/iaccpet_text.dart';
import 'package:mrjoo/features/auth/register/presentation/widgets/privacy_text_button.dart';
import 'package:mrjoo/features/auth/register/presentation/widgets/terms_text_button.dart';

class AcceptTermsRow extends StatelessWidget {
  const AcceptTermsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AccpetIcon(),
        IAcceptText(),
        TremsTextButton(),
        PrivacyTextButton(),
      ],
    );
  }
}
