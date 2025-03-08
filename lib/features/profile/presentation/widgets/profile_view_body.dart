import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/app_images.dart';
import 'package:mrjoo/core/widgets/avatar.dart';
import 'package:mrjoo/features/profile/presentation/manager/profile_cubit.dart';
import 'package:mrjoo/features/profile/presentation/widgets/teacher_accounts.dart';
import 'package:mrjoo/features/profile/presentation/widgets/teacher_data.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return Column(
      children: [
        const SizedBox(height: 84),
        Avatar(imagePath: AppImages.kAvaterLogo),
        const SizedBox(height: 56),
        TeacherData(teacherModel: cubit.teacherModel),
        const TeacherAccounts(),
      ],
    );
  }
}
