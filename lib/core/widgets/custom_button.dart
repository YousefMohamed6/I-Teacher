import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
  });
  final VoidCallback onPressed;
  final Widget child;
  @override
  Widget build(context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          child: child,
        ),
      ],
    );
  }
}
