import 'package:flutter/material.dart';
import 'package:iteacher/core/widgets/custom_drawer.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/auth/login/presentation/widgets/login_view_body.dart';
import 'package:iteacher/generated/app_localizations.dart';

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
