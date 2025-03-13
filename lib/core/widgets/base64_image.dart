import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBase64Image extends StatelessWidget {
  const CustomBase64Image({
    super.key,
    required this.base64,
    this.radius,
  });
  final String base64;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CircleAvatar(
        radius: radius ?? 64.r + 1,
        backgroundColor: Colors.grey,
        child: CircleAvatar(
          radius: radius ?? 64.r,
          backgroundImage: MemoryImage(
            base64Decode(base64),
          ),
        ),
      ),
    );
  }
}
