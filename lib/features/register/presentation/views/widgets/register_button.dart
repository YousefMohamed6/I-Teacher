import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/widgets/custom_button.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/register/data/register_cubit/register_cubit.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: Colors.white,
      onPressed: () async {
        if (BlocProvider.of<RegisterCubit>(context)
            .formKey
            .currentState!
            .validate()) {
          BlocProvider.of<RegisterCubit>(context).register(context);
        }
      },
      child: const CustomText(
        text: 'Register',
        fontSize: 16,
        color: kPrimryColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
