import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/widgets/custom_form_field.dart';
import 'package:iteacher/features/auth/rest_Password/persentation/manager/rest_password_cubit.dart';
import 'package:iteacher/generated/app_localizations.dart';

class RestPasswordEmailFeild extends StatelessWidget {
  const RestPasswordEmailFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      controller:
          BlocProvider.of<RestPasswordCubit>(context).emailTextController,
      lablelText: AppLocalizations.of(context)!.email,
      hintText: AppLocalizations.of(context)!.enter_email,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: (value) async {
        BlocProvider.of<RestPasswordCubit>(context).emailTextController.text =
            value;
        await BlocProvider.of<RestPasswordCubit>(context).restPassword();
      },
    );
  }
}
