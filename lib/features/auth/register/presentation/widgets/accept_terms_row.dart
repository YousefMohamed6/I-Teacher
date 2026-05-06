import 'package:flutter/material.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
import 'package:iteacher/features/auth/register/presentation/widgets/accept_icon.dart';
import 'package:iteacher/features/auth/register/presentation/widgets/i_accept_text.dart';
import 'package:iteacher/features/auth/register/presentation/widgets/terms_text_button.dart';

class AcceptTermsRow extends StatelessWidget {
  const AcceptTermsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppDimensions.kPadding16,
      children: const [
        AcceptIcon(),
        IAcceptText(),
        TermsTextButton(),
      ],
    );
  }
}
