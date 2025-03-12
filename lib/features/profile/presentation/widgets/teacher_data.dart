import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/core/utils/constants/app_fonts.dart';
import 'package:mrjoo/core/utils/constants/keys.dart';
import 'package:mrjoo/core/utils/helper/url_launcher.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/profile/data/model/teacher_model.dart';
import 'package:mrjoo/features/profile/presentation/widgets/contect_item.dart';
import 'package:mrjoo/generated/app_localizations.dart';

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
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 16.h),
        CustomText(
          text: teacherModel.department,
          textAlign: TextAlign.center,
          fontSize: 20.sp,
          fontFamily: AppFonts.kPacificoFont,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 8.h),
        ContactItem(
          mainAxisAlignment: MainAxisAlignment.center,
          text: "${AppLocalizations.of(context)!.phone} : ",
          textButton: teacherModel.phone,
          onPressed: () async {
            final String url = 'tel:${teacherModel.phone}';
            await UrlLauncher.launcher(url: url);
          },
        ),
        ContactItem(
          mainAxisAlignment: MainAxisAlignment.center,
          text: "${AppLocalizations.of(context)!.email} : ",
          textButton: teacherModel.email,
          onPressed: () async {
            final String url =
                'mailto:${teacherModel.email}?subject=${AppKeys.kEmailSubject}';
            await UrlLauncher.launcher(url: url);
          },
        ),
        SizedBox(height: 32.h),
      ],
    );
  }
}
