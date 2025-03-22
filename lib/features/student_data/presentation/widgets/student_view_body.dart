import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/features/student_data/presentation/manager/student_cubit.dart';
import 'package:iteacher/features/student_data/presentation/widgets/address_text_field.dart';
import 'package:iteacher/features/student_data/presentation/widgets/email_text_field.dart';
import 'package:iteacher/features/student_data/presentation/widgets/full_name_text_field.dart';
import 'package:iteacher/features/student_data/presentation/widgets/next_button.dart';
import 'package:iteacher/features/student_data/presentation/widgets/phone_text_field.dart';
import 'package:iteacher/features/student_data/presentation/widgets/student_image.dart';
import 'package:iteacher/features/student_data/presentation/widgets/teacher_id_text_field.dart';

class StudentViewBody extends StatelessWidget {
  const StudentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<StudentCubit>(context).formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StudentImage(),
            SizedBox(height: 24.h),
            FullNameTextField(),
            EmailTextField(),
            PhoneTextField(),
            AddressTextField(),
            TeacherIdTextField(),
            SizedBox(height: 24.h),
            NextButton(),
          ],
        ),
      ),
    );
  }
}
