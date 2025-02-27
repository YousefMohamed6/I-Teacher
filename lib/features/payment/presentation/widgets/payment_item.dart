import 'package:flutter/material.dart';
import 'package:mrjoo/core/widgets/asset_image.dart';
import 'package:mrjoo/features/payment/data/models/payment_methods/payment_methods.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    super.key,
    required this.paymentMethodsModel,
    required this.onTap,
  });
  final VoidCallback onTap;
  final PaymentMethodsModel paymentMethodsModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.white,
            ),
            margin: const EdgeInsets.all(16),
            child: CustomAssetImage(
              imagePath: paymentMethodsModel.logo,
              width: (MediaQuery.of(context).size.width * 0.4),
              height: (MediaQuery.of(context).size.height * 0.25),
            ),
          ),
        ),
      ],
    );
  }
}
