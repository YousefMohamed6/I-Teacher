import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/features/profile/data/model/account_model.dart';
import 'package:mrjoo/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';

class AddAccountButton extends StatelessWidget {
  const AddAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        context.read<TeacherProfileCubit>().navigateToEditAccountView(
              account: AccountModel(
                icon: '',
                name: '',
                url: '',
              ),
              context: context,
            );
      },
      icon: const Icon(
        Icons.add,
        size: 36,
      ),
    );
  }
}
