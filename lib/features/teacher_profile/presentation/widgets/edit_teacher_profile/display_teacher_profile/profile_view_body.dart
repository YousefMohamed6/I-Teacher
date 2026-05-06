import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/core/utils/constants/app_fonts.dart';
import 'package:iteacher/core/utils/helper/url_launcher.dart';
import 'package:iteacher/core/widgets/base64_image.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/edit_teacher_profile/display_teacher_profile/contact_item.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/edit_teacher_profile/display_teacher_profile/teacher_accounts.dart';
import 'package:iteacher/generated/app_localizations.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key, required this.teacherModel});
  final TeacherModel teacherModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 36.h),
        CustomBase64Image(
          base64: teacherModel.imageBase64,
          radius: 84.h,
        ),
        SizedBox(height: 36.h),
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
            const String emailSubject = 'I Teacher';
            final String url =
                'mailto:${teacherModel.email}?subject=$emailSubject';
            await UrlLauncher.launcher(url: url);
          },
        ),
        SizedBox(height: 16.h),
        TeacherAccounts(accounts: teacherModel.accounts.toList()),
      ],
    );
  }
}
