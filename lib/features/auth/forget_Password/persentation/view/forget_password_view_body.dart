import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/constants/images.dart';
import 'package:mrjoo/core/widgets/avatar.dart';
import 'package:mrjoo/core/widgets/custom_button.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/auth/forget_Password/persentation/manager/forget_password_cubit.dart';

class ForgetPasswodBody extends StatelessWidget {
  const ForgetPasswodBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<ForgetPasswordCubit>(context).formKey,
      child: ListView(
        children: [
          const SizedBox(height: 84),
          const Avatar(image: AppImages.kAvaterLogo),
          const SizedBox(height: 54),
          CustomFormField(
            controller: BlocProvider.of<ForgetPasswordCubit>(context).email,
            hintText: "Enter your Email",
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onFieldSubmitted: (value) async {
              BlocProvider.of<ForgetPasswordCubit>(context).email.text = value;
              await BlocProvider.of<ForgetPasswordCubit>(context)
                  .restPassword();
            },
          ),
          const SizedBox(height: 32),
          CustomButton(
            color: Colors.white,
            minWidth: 300,
            onPressed: () async {
              var formKey =
                  BlocProvider.of<ForgetPasswordCubit>(context).formKey;
              if (formKey.currentState!.validate()) {
                await BlocProvider.of<ForgetPasswordCubit>(context)
                    .restPassword();
              }
            },
            child: const CustomText(
              text: "Rest",
              color: AppColors.kPrimryColor,
            ),
          ),
        ],
      ),
    );
  }
}
