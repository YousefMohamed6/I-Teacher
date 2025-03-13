import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/core/utils/constants/app_fonts.dart';
import 'package:mrjoo/core/utils/constants/keys.dart';
import 'package:mrjoo/core/utils/helper/url_launcher.dart';
import 'package:mrjoo/core/widgets/base64_image.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/profile/presentation/manager/profile_cubit.dart';
import 'package:mrjoo/features/profile/presentation/widgets/contect_item.dart';
import 'package:mrjoo/features/profile/presentation/widgets/teacher_accounts.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class TeacherData extends StatelessWidget {
  const TeacherData({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final teacherModel = context.read<ProfileCubit>().teacherModel;
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
            final String url =
                'mailto:${teacherModel.email}?subject=${AppKeys.kEmailSubject}';
            await UrlLauncher.launcher(url: url);
          },
        ),
        SizedBox(height: 16.h),
        TeacherAccounts(),
      ],
    );
  }
}
