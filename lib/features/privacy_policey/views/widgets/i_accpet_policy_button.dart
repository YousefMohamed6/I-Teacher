import 'package:flutter/material.dart';
import 'package:mrjoo/core/widgets/app_button.dart';
import 'package:mrjoo/features/register/presentation/views/register_view.dart';

class IAcceptPolicy extends StatelessWidget {
  const IAcceptPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: 'I Accept',
      onPressed: () {
        Navigator.pushNamed(context, RegisterView.id);
      },
    );
  }
}
