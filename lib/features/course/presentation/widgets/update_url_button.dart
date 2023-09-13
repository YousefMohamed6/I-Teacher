import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/widgets/custom_button.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/course/data/course_view_cubit/course_view_cubit.dart';

class UpdateUrlButton extends StatelessWidget {
  const UpdateUrlButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        BlocProvider.of<CourseCubit>(context).updateUrl();
      },
      child: const CustomText(
        text: 'Update',
        color: kAppBarColor,
      ),
    );
  }
}