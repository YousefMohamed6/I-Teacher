import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.imagePath,
    this.radius = 100,
    this.backgroundColor,
  });
  final String imagePath;
  final double radius;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: (radius) + 1,
      backgroundColor: backgroundColor ?? Colors.grey,
      child: CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }
}
