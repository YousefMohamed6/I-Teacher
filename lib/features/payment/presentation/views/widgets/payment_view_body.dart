import 'package:flutter/material.dart';
import 'package:mrjoo/features/payment/presentation/views/widgets/payment_button.dart';
import 'package:mrjoo/features/payment/presentation/views/widgets/payment_company_image.dart';
import 'package:mrjoo/features/payment/presentation/views/widgets/payment_items.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 48),
        PaymentCompanyImage(),
        SizedBox(height: 48),
        PaymentItems(),
        SizedBox(height: 32),
        PaymentButton(),
      ],
    );
  }
}
