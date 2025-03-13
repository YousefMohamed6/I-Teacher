import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/base64_image.dart';
import 'package:mrjoo/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';

class AccountIcon extends StatelessWidget {
  const AccountIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<TeacherProfileCubit>(context);
    return BlocBuilder<TeacherProfileCubit, TeacherProfileState>(
      buildWhen: (previous, current) => current is UpdateUI,
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            cubit.pickAccountImage();
          },
          child: CustomBase64Image(
            base64: cubit.accountIconTextController.text,
          ),
        );
      },
    );
  }
}
