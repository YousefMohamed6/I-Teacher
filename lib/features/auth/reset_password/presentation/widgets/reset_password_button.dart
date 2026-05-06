import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/widgets/custom_button.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/auth/reset_password/presentation/manager/reset_password_cubit.dart';
import 'package:iteacher/l10n.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () async {
        var formKey = BlocProvider.of<ResetPasswordCubit>(context).formKey;
        if (formKey.currentState!.validate()) {
          await BlocProvider.of<ResetPasswordCubit>(context).resetPassword();
        }
      },
      child: CustomText(
        text: AppLocalizations.of(context)!.reset,
      ),
    );
  }
}
