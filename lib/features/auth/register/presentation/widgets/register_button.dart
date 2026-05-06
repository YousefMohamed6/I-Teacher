import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/extentions/theme_extension.dart';
import 'package:iteacher/core/utils/constants/app_font_sizes.dart';
import 'package:iteacher/core/widgets/custom_button.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:iteacher/generated/app_localizations.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () async {
        BlocProvider.of<RegisterCubit>(context).registerStudent();
      },
      child: CustomText(
        text: AppLocalizations.of(context)!.register,
        fontSize: AppFontSizes.s16,
        color: context.colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
