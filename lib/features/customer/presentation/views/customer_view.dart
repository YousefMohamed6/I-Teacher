import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/constants/fonts.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/customer/presentation/widgets/customer_view_body.dart';

class CustomerView extends StatelessWidget {
  const CustomerView({super.key});
  static String id = 'CustomerView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(
          text: "Customer",
          fontFamily: AppFonts.kPacificoFont,
          fontSize: 24,
          color: Colors.white,
        ),
        backgroundColor: AppColors.kAppBarColor,
      ),
      body: const Background(
        child: CustomerViewBody(),
      ),
    );
  }
}
