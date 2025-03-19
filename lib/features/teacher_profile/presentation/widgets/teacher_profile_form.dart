import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';
import 'package:mrjoo/features/teacher_profile/presentation/widgets/course_link_text_field.dart';
import 'package:mrjoo/features/teacher_profile/presentation/widgets/course_price_text_field.dart';
import 'package:mrjoo/features/teacher_profile/presentation/widgets/department_text_field.dart';
import 'package:mrjoo/features/teacher_profile/presentation/widgets/description_text_field.dart';
import 'package:mrjoo/features/teacher_profile/presentation/widgets/edit_teacher_image.dart';
import 'package:mrjoo/features/teacher_profile/presentation/widgets/first_name_text_field.dart';
import 'package:mrjoo/features/teacher_profile/presentation/widgets/last_name_text_field.dart';
import 'package:mrjoo/features/teacher_profile/presentation/widgets/phone_text_field.dart';
import 'package:mrjoo/features/teacher_profile/presentation/widgets/teacher_accounts.dart';
import 'package:mrjoo/features/teacher_profile/presentation/widgets/teacher_id_text_field.dart';

class TeacherProfileForm extends StatelessWidget {
  const TeacherProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TeacherProfileCubit>();
    return Form(
      key: cubit.formkey,
      child: ListView(
        children: [
          EditTeacherImage(),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(child: FirstNameTextField()),
              Expanded(child: LastNameTextField()),
            ],
          ),
          TeacherIDTextField(),
          PhoneTextField(),
          CourseLinkTextField(),
          CoursePriceTextField(),
          DepartmentTextField(),
          DescriptionTextField(),
          SizedBox(height: 8.h),
          TeacherSocialMediaAccounts(),
        ],
      ),
    );
  }
}
