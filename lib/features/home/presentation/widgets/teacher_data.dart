import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/constants/fonts.dart';
import 'package:mrjoo/core/utils/constants/keys.dart';
import 'package:mrjoo/core/utils/services/url_launcher.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/home/presentation/widgets/contect_item.dart';

class TeacherData extends StatelessWidget {
  const TeacherData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomText(
          text: AppKeys.kTeacherName,
          textAlign: TextAlign.center,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.kMainTextColor,
        ),
        const SizedBox(height: 16),
        const CustomText(
          text: AppKeys.kTeacherJob,
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
          textButton: AppKeys.kPhone,
          onPressed: () async {
            await UrlLauncher.launcher(url: 'tel:${AppKeys.kPhone}');
          },
        ),
        ContactItem(
          mainAxisAlignment: MainAxisAlignment.center,
          text: "Email Address : ",
          textButton: AppKeys.kEmail,
          onPressed: () async {
            await UrlLauncher.launcher(
                url:
                    'mailto:${AppKeys.kEmail}?subject=${AppKeys.kEmailSubject}');
          },
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
