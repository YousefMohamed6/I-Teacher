import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/core/utils/constants/app_images.dart';

class CustomBase64Image extends StatelessWidget {
  const CustomBase64Image({
    super.key,
    required this.base64,
    this.radius,
  });
  final String base64;
  final double? radius;
  bool isValidBase64(String str) {
    try {
      if (str.isEmpty) return false;
      base64Decode(str);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CircleAvatar(
        radius: radius ?? 64.r + 1,
        backgroundColor: Colors.grey,
        child: CircleAvatar(
          radius: radius ?? 64.r,
          backgroundImage: isValidBase64(base64)
              ? MemoryImage(base64Decode(base64))
              : AssetImage(AppImages.kProfileLogo) as ImageProvider,
        ),
      ),
    );
  }
}
