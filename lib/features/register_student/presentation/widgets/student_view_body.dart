import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
import 'package:iteacher/features/register_student/presentation/manager/register_student_cubit.dart';
import 'package:iteacher/features/register_student/presentation/widgets/address_text_field.dart';
import 'package:iteacher/features/register_student/presentation/widgets/email_text_field.dart';
import 'package:iteacher/features/register_student/presentation/widgets/full_name_text_field.dart';
import 'package:iteacher/features/register_student/presentation/widgets/next_button.dart';
import 'package:iteacher/features/register_student/presentation/widgets/phone_text_field.dart';
import 'package:iteacher/features/register_student/presentation/widgets/student_image.dart';
import 'package:iteacher/features/register_student/presentation/widgets/teacher_id_text_field.dart';

class StudentViewBody extends StatelessWidget {
  const StudentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<StudentCubit>(context).formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(AppDimensions.kPadding16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const StudentImage(),
            SizedBox(height: AppDimensions.kPadding24),
            const FullNameTextField(),
            const EmailTextField(),
            const PhoneTextField(),
            const AddressTextField(),
            const TeacherIdTextField(),
            SizedBox(height: AppDimensions.kPadding32),
            const NextButton(),
            SizedBox(height: AppDimensions.kPadding24),
          ],
        ),
      ),
    );
  }
}
