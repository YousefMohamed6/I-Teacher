import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/core/utils/constants/app_fonts.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/payment/presentation/widgets/payment_view_body.dart';
import 'package:iteacher/generated/app_localizations.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});
  static const String routeName = '/PaymentPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.of(context)!.payment,
          fontFamily: AppFonts.kPacificoFont,
          fontSize: 20.sp,
          color: Colors.white,
        ),
      ),
      body: PaymentViewBody(),
    );
  }
}
