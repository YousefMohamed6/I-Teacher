import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/widgets/custom_button.dart';
import 'package:iteacher/features/register_teacher/presentation/manager/register_teacher_cubit.dart';
import 'package:iteacher/generated/app_localizations.dart';

class RegisterTeacherButton extends StatelessWidget {
  const RegisterTeacherButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        context.read<RegisterTeacherCubit>().sendPaymentRequest();
      },
      child: Text(
        AppLocalizations.of(context)!.register,
      ),
    );
  }
}
