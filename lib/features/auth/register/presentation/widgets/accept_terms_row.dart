import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/features/auth/register/presentation/widgets/accpet_icon.dart';
import 'package:iteacher/features/auth/register/presentation/widgets/i_accpet_text.dart';
import 'package:iteacher/features/auth/register/presentation/widgets/terms_text_button.dart';

class AcceptTermsRow extends StatelessWidget {
  const AcceptTermsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.w,
      children: [
        AccpetIcon(),
        IAcceptText(),
        TremsTextButton(),
      ],
    );
  }
}
