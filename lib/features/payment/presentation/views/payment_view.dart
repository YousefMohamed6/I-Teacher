import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/core/utils/constants/app_fonts.dart';
import 'package:mrjoo/core/widgets/app_drawer.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/payment/presentation/widgets/payment_view_body.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});
  static const String routeName = '/PaymentPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.kAppBarColor,
        centerTitle: true,
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
