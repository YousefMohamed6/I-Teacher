import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/core/utils/constants/app_images.dart';
import 'package:mrjoo/core/widgets/avatar.dart';
import 'package:mrjoo/core/widgets/custom_button.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/auth/rest_Password/persentation/manager/rest_password_cubit.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class ForgetPasswodBody extends StatelessWidget {
  const ForgetPasswodBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<RestPasswordCubit>(context).formKey,
      child: ListView(
        children: [
          const SizedBox(height: 84),
          const Avatar(image: AppImages.kAvaterLogo),
          const SizedBox(height: 54),
          CustomFormField(
            controller: BlocProvider.of<RestPasswordCubit>(context).email,
            lablelText: AppLocalizations.of(context)!.email,
            hintText: AppLocalizations.of(context)!.enter_email,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onFieldSubmitted: (value) async {
              BlocProvider.of<RestPasswordCubit>(context).email.text = value;
              await BlocProvider.of<RestPasswordCubit>(context).restPassword();
            },
          ),
          const SizedBox(height: 32),
          CustomButton(
            color: Colors.white,
            minWidth: 300,
            onPressed: () async {
              var formKey = BlocProvider.of<RestPasswordCubit>(context).formKey;
              if (formKey.currentState!.validate()) {
                await BlocProvider.of<RestPasswordCubit>(context)
                    .restPassword();
              }
            },
            child: CustomText(
              text: AppLocalizations.of(context)!.rest,
              color: AppColors.kPrimryColor,
            ),
          ),
        ],
      ),
    );
  }
}
