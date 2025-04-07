import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/core/widgets/background.dart';
import 'package:iteacher/core/widgets/base64_image.dart';
import 'package:iteacher/features/register_student/data/model/student_model.dart';
import 'package:iteacher/generated/app_localizations.dart';

class StudentProfileView extends StatelessWidget {
  const StudentProfileView({super.key, required this.student});
  static const String routeName = '/StudentProfile';
  final StudentModel student;
  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final textStyle = Theme.of(context).textTheme.bodyLarge;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.student_profile),
      ),
      body: Background(
        child: Container(
          padding: EdgeInsets.all(16.w),
          margin: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4.h,
            children: [
              SizedBox(height: 8.h),
              CustomBase64Image(
                base64: student.imageBase64,
                radius: 72.r,
              ),
              SizedBox(height: 8.h),
              Text(
                '${student.firstName} ${student.lastName}',
                style: textStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${localizations.subscription_date}: ",
                      style: textStyle),
                  Text(student.subscriptionDate.toString().substring(0, 10)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${localizations.expiry_date}: ", style: textStyle),
                  Text(student.expiryDate.toString().substring(0, 10)),
                ],
              ),
              Text(student.email, style: textStyle),
              Text(student.phone, style: textStyle),
              Text(student.address, style: textStyle),
            ],
          ),
        ),
      ),
    );
  }
}
