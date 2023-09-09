import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';

class Background extends StatelessWidget {
  const Background({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [kPrimryColor, kSecondColor],
        ),
      ),
      child: child,
    );
  }
}
