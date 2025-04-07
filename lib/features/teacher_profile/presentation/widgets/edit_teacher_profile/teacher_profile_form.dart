import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/edit_teacher_profile/channal_id_text_field.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/edit_teacher_profile/course_price_text_field.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/edit_teacher_profile/department_text_field.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/edit_teacher_profile/description_text_field.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/edit_teacher_profile/edit_teacher_image.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/edit_teacher_profile/first_name_text_field.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/edit_teacher_profile/last_name_text_field.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/edit_teacher_profile/payment_id_text_field%20.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/edit_teacher_profile/phone_text_field.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/edit_teacher_profile/teacher_accounts.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/edit_teacher_profile/teacher_id_text_field.dart';

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
          PaymentIDTextField(),
          PhoneTextField(),
          ChannalIdTextField(),
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
