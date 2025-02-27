import 'package:flutter/material.dart';

class CustomAssetImage extends StatelessWidget {
  const CustomAssetImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
  });
  final String imageUrl;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
    );
  }
}
