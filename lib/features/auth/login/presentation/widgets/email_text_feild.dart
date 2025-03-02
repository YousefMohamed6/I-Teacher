import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class EmailTextFaild extends StatelessWidget {
  const EmailTextFaild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<LoginCubit>(context).emailkey,
      child: CustomFormField(
        textInputType: TextInputType.emailAddress,
        prefixIcon: const Icon(Icons.email),
        lablelText: AppLocalizations.of(context)!.email,
        hintText: AppLocalizations.of(context)!.enter_email,
        controller: BlocProvider.of<LoginCubit>(context).emailTextController,
      ),
    );
  }
}
