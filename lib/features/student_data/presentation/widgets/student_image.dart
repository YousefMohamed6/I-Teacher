import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/core/widgets/base64_image.dart';
import 'package:mrjoo/features/student_data/presentation/manager/student_cubit.dart';

class StudentImage extends StatelessWidget {
  const StudentImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<StudentCubit>().pickImage();
      },
      child: CustomBase64Image(
        base64: context.watch<StudentCubit>().studentData.imageBase64,
        radius: 80.r,
      ),
    );
  }
}
