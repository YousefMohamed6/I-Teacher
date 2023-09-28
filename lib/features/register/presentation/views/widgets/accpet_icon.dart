import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/features/register/data/register_cubit/register_cubit.dart';
import 'package:mrjoo/features/register/data/register_cubit/register_state.dart';

class AccpetIcon extends StatelessWidget {
  const AccpetIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return IconButton(
          padding: EdgeInsets.zero,
          icon: BlocProvider.of<RegisterCubit>(context).isAccept
              ? const Icon(
                  Icons.check_circle,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.check_circle_outline,
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
