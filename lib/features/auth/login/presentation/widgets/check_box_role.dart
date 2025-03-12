import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class CheckBoxRole extends StatelessWidget {
  const CheckBoxRole({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => current is UpdateUI,
      builder: (context, state) {
        return Row(
          children: [
            Checkbox(
              value: cubit.isStudent,
              onChanged: (value) {
                cubit.changeRole(value ?? false);
              },
            ),
            CustomText(text: AppLocalizations.of(context)!.student),
          ],
        );
      },
    );
  }
}
