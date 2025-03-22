import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iteacher/core/widgets/base64_image.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/profile/data/model/teacher_model.dart';
import 'package:iteacher/features/profile/presentation/views/profile_view.dart';

class TeacherItem extends StatelessWidget {
  const TeacherItem({super.key, required this.teacherModel});
  final TeacherModel teacherModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(ProfileView.routeName, extra: teacherModel);
      },
      child: Card(
        margin: EdgeInsets.all(16.h),
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: Column(
            children: [
              CustomBase64Image(
                base64: teacherModel.imageBase64,
                radius: 80.r,
              ),
              ListTile(
                title: CustomText(
                    text: '${teacherModel.firstName} ${teacherModel.lastName}'),
                trailing: CustomText(text: teacherModel.coursePrice),
                isThreeLine: true,
                contentPadding: EdgeInsets.only(left: 8.w, right: 16.w),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8.h,
                  children: [
                    CustomText(text: teacherModel.department),
                    CustomText(text: teacherModel.description),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
