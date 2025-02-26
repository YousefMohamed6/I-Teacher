import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';

class Background extends StatelessWidget {
  const Background({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.kPrimryColor,AppColors. kSecondColor],
        ),
      ),
      child: child,
    );
  }
}
