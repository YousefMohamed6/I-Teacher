import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_button.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:mrjoo/mr_joo.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () async {
        final formKey = BlocProvider.of<RegisterCubit>(context).formKey;
        if (formKey.currentState!.validate()) {
          BlocProvider.of<RegisterCubit>(context)
              .createUserWithEmailAndPassword();
        }
      },
      child: CustomText(
        text: AppLocalizations.of(context)!.register,
        fontSize: 16,
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
