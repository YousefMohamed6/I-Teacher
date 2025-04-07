import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/widgets/custom_form_field.dart';
import 'package:iteacher/features/register_teacher/presentation/manager/register_teacher_cubit.dart';
import 'package:iteacher/generated/app_localizations.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.visiblePassword,
      prefixIcon: const Icon(Icons.security_outlined),
      lablelText: AppLocalizations.of(context)!.password,
      hintText: AppLocalizations.of(context)!.enter_password,
      obscureText: context.watch<RegisterTeacherCubit>().obscureText,
      suffixIcon: IconButton(
        onPressed: () {
          BlocProvider.of<RegisterTeacherCubit>(context).toggleObscureText();
        },
        icon: Icon(
          BlocProvider.of<RegisterTeacherCubit>(context).obscureText
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
        ),
      ),
      controller:
          BlocProvider.of<RegisterTeacherCubit>(context).passwordTextController,
    );
  }
}
