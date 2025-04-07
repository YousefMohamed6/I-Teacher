import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/core/widgets/base64_image.dart';
import 'package:iteacher/features/register_teacher/presentation/manager/register_teacher_cubit.dart';

class TeacherImage extends StatelessWidget {
  const TeacherImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<RegisterTeacherCubit>().pickTeacherImage(),
      child: CustomBase64Image(
        radius: 84.r,
        base64: context
            .watch<RegisterTeacherCubit>()
            .imageBase64TextController
            .text,
      ),
    );
  }
}
