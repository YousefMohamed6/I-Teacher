import 'package:flutter/material.dart';
import 'package:mrjoo/features/payment/presentation/widgets/visa_item.dart';
import 'package:mrjoo/features/payment/presentation/widgets/wallet_item.dart';

class PaymentItems extends StatelessWidget {
  const PaymentItems({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Visa(),
        Wallet(),
      ],
    );
  }
}
