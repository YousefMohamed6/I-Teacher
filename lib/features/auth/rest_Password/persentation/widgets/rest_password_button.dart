import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/core/widgets/custom_button.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/auth/rest_Password/persentation/manager/rest_password_cubit.dart';
import 'package:mrjoo/mr_joo.dart';

class RestPasswordButtom extends StatelessWidget {
  const RestPasswordButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: Colors.white,
      minWidth: 300,
      onPressed: () async {
        var formKey = BlocProvider.of<RestPasswordCubit>(context).formKey;
        if (formKey.currentState!.validate()) {
          await BlocProvider.of<RestPasswordCubit>(context).restPassword();
        }
      },
      child: CustomText(
        text: AppLocalizations.of(context)!.rest,
        color: AppColors.kPrimryColor,
      ),
    );
  }
}
