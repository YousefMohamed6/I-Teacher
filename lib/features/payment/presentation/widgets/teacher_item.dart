import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
import 'package:iteacher/core/widgets/base64_image.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';
import 'package:iteacher/features/teacher_profile/presentation/Screens/teacher_profile_view.dart';

class TeacherItem extends StatelessWidget {
  const TeacherItem({super.key, required this.teacherModel});
  final TeacherModel teacherModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(TeacherProfileView.routeName, extra: teacherModel);
      },
      child: Card(
        margin: EdgeInsets.all(AppDimensions.kPadding16),
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.kPadding16),
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
                contentPadding: EdgeInsets.only(
                  left: AppDimensions.kPadding8,
                  right: AppDimensions.kPadding16,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppDimensions.kPadding8,
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
