import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/helper.dart';
import 'package:mrjoo/core/widgets/asset_image.dart';
import 'package:mrjoo/core/widgets/custom_icon_button.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({
    super.key,
    required this.imagePath,
    required this.url,
    this.iconSize = 50,
  });
  final String imagePath;
  final String url;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: CustomAssetImage(imagePath: imagePath),
      iconSize: iconSize,
      onPressed: () async {
        await urlLauncher(url: url);
      },
    );
  }
}