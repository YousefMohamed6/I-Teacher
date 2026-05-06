import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/extentions/theme_extension.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
import 'package:iteacher/features/auth/register/presentation/manager/register_cubit.dart';

class AcceptIcon extends StatelessWidget {
  const AcceptIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<RegisterCubit>();
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return IconButton(
          icon: cubit.isAccept
              ? Icon(
                  Icons.check_circle,
                  color: context.colorScheme.primary,
                  size: AppDimensions.kIcon24,
                )
              : Icon(
                  Icons.check_circle_outline,
                  size: AppDimensions.kIcon24,
                ),
          onPressed: () {
            cubit.changeAccpetTermsAndPrivacy();
          },
        );
      },
    );
  }
}
