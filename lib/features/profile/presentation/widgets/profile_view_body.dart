import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        SizedBox(height: 36.h),
        Avatar(imagePath: AppImages.kAvaterLogo),
        SizedBox(height: 36.h),
        TeacherData(teacherModel: cubit.teacherModel),
        TeacherAccounts(
          accounts: cubit.teacherModel.accounts,
        ),
      ],
    );
  }
}
