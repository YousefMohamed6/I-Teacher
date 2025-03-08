import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/helper/url_launcher.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/core/utils/constants/app_fonts.dart';
import 'package:mrjoo/core/utils/constants/keys.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/profile/presentation/widgets/contect_item.dart';
import 'package:mrjoo/features/student_data/data/model/teacher_model.dart';

class TeacherData extends StatelessWidget {
  const TeacherData({super.key, required this.teacherModel});
  final TeacherModel teacherModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: '${teacherModel.firstName} ${teacherModel.lastName}',
          textAlign: TextAlign.center,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.kMainTextColor,
        ),
        const SizedBox(height: 16),
        CustomText(
          text: teacherModel.department,
          textAlign: TextAlign.center,
          fontSize: 24,
          fontFamily: AppFonts.kPacificoFont,
          fontWeight: FontWeight.bold,
          color: AppColors.kMainTextColor,
        ),
        const SizedBox(height: 5),
        ContactItem(
          mainAxisAlignment: MainAxisAlignment.center,
          text: "Phone Number : ",
          textButton: teacherModel.phone,
          onPressed: () async {
            await UrlLauncher.launcher(url: 'tel:${teacherModel.phone}');
          },
        ),
        ContactItem(
          mainAxisAlignment: MainAxisAlignment.center,
          text: "Email Address : ",
          textButton: teacherModel.email,
          onPressed: () async {
            await UrlLauncher.launcher(
                url:
                    'mailto:${teacherModel.email}?subject=${AppKeys.kEmailSubject}');
          },
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
