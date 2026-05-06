import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/widgets/custom_form_field.dart';
import 'package:iteacher/features/auth/reset_password/presentation/manager/reset_password_cubit.dart';
import 'package:iteacher/generated/app_localizations.dart';

class ResetPasswordEmailField extends StatelessWidget {
  const ResetPasswordEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      controller:
          BlocProvider.of<ResetPasswordCubit>(context).emailTextController,
      labelText: AppLocalizations.of(context)!.email,
      hintText: AppLocalizations.of(context)!.enter_email,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: (value) async {
        BlocProvider.of<ResetPasswordCubit>(context).emailTextController.text =
            value;
        await BlocProvider.of<ResetPasswordCubit>(context).resetPassword();
      },
    );
  }
}
