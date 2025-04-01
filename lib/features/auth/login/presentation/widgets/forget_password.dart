import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iteacher/core/widgets/custom_text_button.dart';
import 'package:iteacher/features/auth/login/presentation/widgets/check_box_role.dart';
import 'package:iteacher/features/auth/rest_Password/persentation/view/rest_password_view.dart';
import 'package:iteacher/generated/app_localizations.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CheckBoxRole(),
        const Spacer(),
        CustomTextButton(
          text: AppLocalizations.of(context)!.forget_password,
          onPressed: () {
            context.pushNamed(RestPasswordView.routeName);
          },
        ),
      ],
    );
  }
}
