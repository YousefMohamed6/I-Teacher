import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeacherImage extends StatelessWidget {
  const TeacherImage({super.key, required this.imageBase64});
  final String imageBase64;
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CircleAvatar(
        radius: 64.r + 1,
        backgroundColor: Colors.grey,
        child: CircleAvatar(
          radius: 64.r,
          backgroundImage: MemoryImage(
            base64Decode(imageBase64),
          ),
        ),
      ),
    );
  }
}
