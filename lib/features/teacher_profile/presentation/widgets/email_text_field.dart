import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomFormField(
        textInputType: TextInputType.emailAddress,
        prefixIcon: const Icon(Icons.email_outlined),
        lablelText: AppLocalizations.of(context)!.email,
        hintText: AppLocalizations.of(context)!.enter_email,
        controller:
            BlocProvider.of<TeacherProfileCubit>(context).emailTextController,
      ),
    );
  }
}
