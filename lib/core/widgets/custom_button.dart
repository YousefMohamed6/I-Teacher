import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.height,
    this.borderRadius,
  });

  final VoidCallback onPressed;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double? height;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        minimumSize: Size(width ?? double.infinity, height ?? AppDimensions.kButtonHeight48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? AppDimensions.kRadius12),
        ),
      ),
      child: child,
    )
    .animate()
    .scale(
      begin: const Offset(0.95, 0.95),
      end: const Offset(1, 1),
      duration: 300.ms,
      curve: Curves.easeOutBack,
    )
    .fadeIn(duration: 300.ms);
  }
}
