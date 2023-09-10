import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/images.dart';

class PaymentCompanyImage extends StatelessWidget {
  const PaymentCompanyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width * 0.45),
      height: (MediaQuery.of(context).size.height * 0.25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
        image: const DecorationImage(
          image: AssetImage(
            kFawaterakLogo,
          ),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 48),
    );
  }
}
