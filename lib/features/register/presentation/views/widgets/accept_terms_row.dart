import 'package:flutter/material.dart';
import 'package:mrjoo/features/register/presentation/views/widgets/accpet_icon.dart';
import 'package:mrjoo/features/register/presentation/views/widgets/iaccpet_text.dart';
import 'package:mrjoo/features/register/presentation/views/widgets/privacy_text_button.dart';
import 'package:mrjoo/features/register/presentation/views/widgets/terms_text_button.dart';

class AcceptTermsRow extends StatelessWidget {
  const AcceptTermsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AccpetIcon(),
        IAcceptText(),
        TremsTextButton(),
        PrivacyTextButton(),
      ],
    );
  }
}
