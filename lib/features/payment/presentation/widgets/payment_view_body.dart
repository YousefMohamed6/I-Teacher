import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/features/payment/presentation/widgets/payment_button.dart';
import 'package:mrjoo/features/payment/presentation/widgets/payment_company_image.dart';
import 'package:mrjoo/features/payment/presentation/widgets/payment_items.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        PaymentCompanyImage(),
        Spacer(),
        SizedBox(
          height: (MediaQuery.of(context).size.height * 0.30).h,
          width: double.infinity,
          child: PaymentItems(),
        ),
        Spacer(),
        PaymentButton(),
        Spacer(),
      ],
    );
  }
}
