import 'package:flutter/material.dart';
import 'package:mrjoo/features/home/presentation/views/widgets/contect_item.dart';
import 'package:mrjoo/features/login/presentation/views/login_view.dart';

class SignInRow extends StatelessWidget {
  const SignInRow({super.key});

  @override
  Widget build(BuildContext context) {
    return ContectItem(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      text: "already have an account",
      textButton: "Sign In",
      onPressed: () {
        Navigator.pushNamed(context, LoginView.id);
      },
    );
  }
}
