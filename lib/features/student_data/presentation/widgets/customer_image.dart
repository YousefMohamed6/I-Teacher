import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/app_images.dart';
import 'package:mrjoo/core/widgets/asset_image.dart';

class CustomerImage extends StatelessWidget {
  const CustomerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAssetImage(
      imagePath: AppImages.kCustomerLogo,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.35,
    );
  }
}
