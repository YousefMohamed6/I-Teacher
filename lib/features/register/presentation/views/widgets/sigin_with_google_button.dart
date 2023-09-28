import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/images.dart';
import 'package:mrjoo/core/widgets/asset_image.dart';
import 'package:mrjoo/core/widgets/custom_icon_button.dart';
import 'package:mrjoo/features/register/data/register_cubit/register_cubit.dart';

class SignWithGoogleButton extends StatelessWidget {
  const SignWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      onPressed: () {
        BlocProvider.of<RegisterCubit>(context).singInWithGoogle(context);
      },
      icon: const CustomAssetImage(
        imagePath: kGoogleLogo,
        height: 32,
      ),
      iconSize: 50,
    );
  }
}
