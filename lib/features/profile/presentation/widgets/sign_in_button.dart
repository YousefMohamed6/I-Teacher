import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/core/widgets/custom_icon_button.dart';
import 'package:mrjoo/features/profile/presentation/manager/profile_cubit.dart';

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
          color: AppColors.kMainTextColor,
        ),
        onPressed: () {
          BlocProvider.of<ProfileCubit>(context).chechLoginState();
        },
      ),
    );
  }
}
