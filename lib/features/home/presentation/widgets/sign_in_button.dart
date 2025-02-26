import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mrjoo/core/widgets/custom_icon_button.dart';
import 'package:mrjoo/features/home/presentation/manager/home_cubit.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: CustomIconButton(
        icon: const Icon(
          FontAwesomeIcons.arrowRightToBracket,
          size: 26,
          color: Colors.white,
        ),
        onPressed: () {
          BlocProvider.of<HomeViewCubit>(context).chechLoginState();
        },
      ),
    );
  }
}
