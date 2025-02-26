import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/constants/fonts.dart';
import 'package:mrjoo/core/utils/constants/text.dart';
import 'package:mrjoo/core/utils/helper.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/home/presentation/widgets/contect_item.dart';

class TeacherData extends StatelessWidget {
  const TeacherData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomText(
          text: kTeacherName,
          textAlign: TextAlign.center,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: kMainTextColor,
        ),
        const SizedBox(height: 16),
        const CustomText(
          text: kTeacherJob,
          textAlign: TextAlign.center,
          fontSize: 24,
          fontFamily: kPacificoFont,
          fontWeight: FontWeight.bold,
          color: kMainTextColor,
        ),
        const SizedBox(height: 5),
        ContectItem(
          mainAxisAlignment: MainAxisAlignment.center,
          text: "Phone Number : ",
          textButton: kPhone,
          onPressed: () async {
            await urlLauncher(url: 'tel:$kPhone');
          },
        ),
        ContectItem(
          mainAxisAlignment: MainAxisAlignment.center,
          text: "Email Address : ",
          textButton: kEmail,
          onPressed: () async {
            await urlLauncher(url: 'mailto:$kEmail?subject=$kEmailSubject');
          },
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
