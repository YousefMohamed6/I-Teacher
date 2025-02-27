import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/app_images.dart';
import 'package:mrjoo/core/widgets/avatar.dart';
import 'package:mrjoo/features/profile/presentation/widgets/teacher_accounts.dart';
import 'package:mrjoo/features/profile/presentation/widgets/teacher_data.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 84),
        Avatar(image: AppImages.kAvaterLogo),
        SizedBox(height: 56),
        TeacherData(),
        TeacherAccounts(),
      ],
    );
  }
}
