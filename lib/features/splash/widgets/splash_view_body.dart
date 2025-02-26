import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/images.dart';
import 'package:mrjoo/core/widgets/asset_image.dart';
import 'package:mrjoo/core/widgets/background.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Background(),
        Center(
          child: CustomAssetImage(
            imagePath: AppImages.kSplashLogo,
          ),
        )
      ],
    );
  }
}
