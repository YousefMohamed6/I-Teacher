import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';
import 'package:iteacher/core/widgets/base64_image.dart';

class EditTeacherImage extends StatelessWidget {
  const EditTeacherImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TeacherProfileCubit>();
    return BlocBuilder<TeacherProfileCubit, TeacherProfileState>(
      buildWhen: (previous, current) => current is UpdateUI,
      builder: (context, state) {
        return GestureDetector(
          onTap: () => cubit.pickTeacherImage(),
          child: CustomBase64Image(
            base64: cubit.teacher.imageBase64,
          ),
        );
      },
    );
  }
}
