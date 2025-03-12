import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/mr_joo.dart';

class IAcceptText extends StatelessWidget {
  const IAcceptText({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: AppLocalizations.of(context)!.i_accept,
      fontSize: 14.sp,
    );
  }
}
