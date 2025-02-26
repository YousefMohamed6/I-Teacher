import 'package:flutter/material.dart';
import 'package:mrjoo/features/auth/login/presentation/views/login_view.dart';
import 'package:mrjoo/features/home/presentation/widgets/contect_item.dart';

class SignInRow extends StatelessWidget {
  const SignInRow({super.key});

  @override
  Widget build(BuildContext context) {
    return ContactItem(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      text: "already have an account",
      textButton: "Sign In",
      onPressed: () {
        Navigator.pushNamed(context, LoginView.id);
      },
    );
  }
}
