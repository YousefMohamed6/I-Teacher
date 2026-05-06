import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
import 'package:iteacher/features/register_teacher/presentation/manager/register_teacher_cubit.dart';
import 'package:iteacher/features/register_teacher/presentation/widgets/address_text_field.dart';
import 'package:iteacher/features/register_teacher/presentation/widgets/email_text_field.dart';
import 'package:iteacher/features/register_teacher/presentation/widgets/first_name_text_field.dart';
import 'package:iteacher/features/register_teacher/presentation/widgets/last_name_text_field.dart';
import 'package:iteacher/features/register_teacher/presentation/widgets/password_text_field.dart';
import 'package:iteacher/features/register_teacher/presentation/widgets/phone_text_field.dart';
import 'package:iteacher/features/register_teacher/presentation/widgets/register_teacher_button.dart';
import 'package:iteacher/features/register_teacher/presentation/widgets/teacher_image.dart';

class RegisterTeacherForm extends StatelessWidget {
  const RegisterTeacherForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<RegisterTeacherCubit>(context).formkey,
      child: ListView(
        padding: EdgeInsets.all(AppDimensions.kPadding16),
        children: [
          const TeacherImage(),
          SizedBox(height: AppDimensions.kPadding24),
          const Row(
            children: [
              Expanded(child: FirstNameTextField()),
              Expanded(child: LastNameTextField()),
            ],
          ),
          const EmailTextField(),
          const PasswordTextField(),
          const PhoneTextField(),
          const AddressTextField(),
          SizedBox(height: AppDimensions.kPadding32),
          const RegisterTeacherButton(),
          SizedBox(height: AppDimensions.kPadding24),
        ],
      ),
    );
  }
}
