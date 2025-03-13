import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';
import 'package:mrjoo/features/teacher_profile/presentation/views/social_media_account_view.dart';

class AddAccountButton extends StatelessWidget {
  const AddAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await showModalBottomSheet(
          context: context,
          useSafeArea: true,
          isScrollControlled: true,
          builder: (_) => BlocProvider.value(
            value: BlocProvider.of<TeacherProfileCubit>(context),
            child: SocialMediaAccountView(),
          ),
        );
      },
      icon: const Icon(
        Icons.add,
        size: 32,
      ),
    );
  }
}
