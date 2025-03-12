import 'dart:convert';

import 'package:flutter/material.dart';

class CustomBase64Image extends StatelessWidget {
  final String base64String;
  final double? width;
  final double? height;
  final BoxFit fit;

  const CustomBase64Image({
    super.key,
    required this.base64String,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.memory(
      base64Decode(base64String),
      width: width,
      height: height,
      fit: fit,
    );
  }
}
