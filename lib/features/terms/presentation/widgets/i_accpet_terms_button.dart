import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mrjoo/core/widgets/app_button.dart';

class IAcceptTerms extends StatelessWidget {
  const IAcceptTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: "I Accept",
      onPressed: () {
        context.pop();
      },
    );
  }
}
