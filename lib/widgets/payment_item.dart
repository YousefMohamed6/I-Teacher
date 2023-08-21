import 'package:flutter/material.dart';
import 'package:mrjoo/consts/colors.dart';
import 'package:mrjoo/widgets/asset_image.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.imagePath, required this.select});
  final String imagePath;
  final bool select;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white,
          ),
          margin: const EdgeInsets.all(16),
          child: CustomAssetImage(
            imagePath: imagePath,
            width: (MediaQuery.of(context).size.width * 0.42),
            height: (MediaQuery.of(context).size.height * 0.42)/2 ,
          ),
        ),
        select
            ? const Icon(
                Icons.add_task,
                color: kMainTextColor,
              )
            : const SizedBox(),
      ],
    );
  }
}
