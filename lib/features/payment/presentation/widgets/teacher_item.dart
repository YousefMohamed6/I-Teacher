import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/core/utils/constants/app_images.dart';
import 'package:mrjoo/core/widgets/avatar.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/student_data/data/model/teacher_model.dart';

class TeacherItem extends StatelessWidget {
  const TeacherItem({super.key, required this.teacherModel});
  final TeacherModel teacherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Avatar(
            imagePath: AppImages.kProfileLogo,
            radius: 48.r,
          ),
          ListTile(
            title: CustomText(
                text: '${teacherModel.firstName} ${teacherModel.lastName}'),
            trailing: CustomText(text: teacherModel.coursePrice),
            subtitle: CustomText(text: teacherModel.department),
          ),
          Padding(
            padding: EdgeInsets.all(6.w),
            child: CustomText(
              text: teacherModel.description,
            ),
          ),
        ],
      ),
    );
  }
}
