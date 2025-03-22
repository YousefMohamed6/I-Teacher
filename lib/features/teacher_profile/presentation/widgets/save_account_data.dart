import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/widgets/custom_button.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';
import 'package:iteacher/generated/app_localizations.dart';

class SaveAccountDataButton extends StatelessWidget {
  const SaveAccountDataButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        BlocProvider.of<TeacherProfileCubit>(context).addAccountData();
      },
      child: CustomText(
        text: AppLocalizations.of(context)!.save,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).primaryColor,
            ),
      ),
    );
  }
}
