import 'package:flutter/material.dart';

class IAcceptText extends StatelessWidget {
  const IAcceptText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'I Accept',
      style: TextStyle(
        fontSize: MediaQuery.sizeOf(context).height * 0.020,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
