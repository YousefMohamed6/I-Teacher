import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:mrjoo/features/auth/register/presentation/manager/register_state.dart';

class AccpetIcon extends StatelessWidget {
  const AccpetIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return IconButton(
          icon: BlocProvider.of<RegisterCubit>(context).isAccept
              ? Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: MediaQuery.sizeOf(context).height * 0.030,
                )
              : Icon(
                  Icons.check_circle_outline,
                  size: MediaQuery.sizeOf(context).height * 0.030,
                ),
          onPressed: () {
            BlocProvider.of<RegisterCubit>(context)
                .changeAccpetTremsAndPrivacy();
          },
        );
      },
    );
  }
}
