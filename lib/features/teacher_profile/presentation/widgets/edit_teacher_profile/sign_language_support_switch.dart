import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';
import 'package:iteacher/generated/app_localizations.dart';

class SignLanguageSupportSwitch extends StatelessWidget {
  const SignLanguageSupportSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TeacherProfileCubit>();
    return SwitchListTile(
      title: CustomText(
        text: AppLocalizations.of(context)!.sign_language_support,
      ),
      value: cubit.supportsSignLanguage,
      onChanged: (value) {
        cubit.changeSignLanguageSupport(value);
      },
    );
  }
}
