import 'package:flutter/material.dart';

class LanguageText extends StatelessWidget {
  const LanguageText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        children: [
          Text(
            "language",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Icon(Icons.keyboard_arrow_down_outlined),
          SizedBox(
            width: 4,
          )
        ],
      ),
    );
  }
}
