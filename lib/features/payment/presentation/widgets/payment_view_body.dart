import 'package:flutter/material.dart';
import 'package:mrjoo/features/payment/presentation/widgets/payment_button.dart';
import 'package:mrjoo/features/payment/presentation/widgets/payment_company_image.dart';
import 'package:mrjoo/features/payment/presentation/widgets/payment_items.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
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
