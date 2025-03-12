import 'package:flutter/material.dart';
import 'package:mrjoo/core/widgets/app_drawer.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/auth/login/presentation/widgets/login_view_body.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String routeName = "/LoginView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.of(context)!.login,
        ),
      ),
      body: const LoginViewBody(),
    );
  }
}
