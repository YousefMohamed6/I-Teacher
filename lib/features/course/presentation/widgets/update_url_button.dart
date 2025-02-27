import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/core/widgets/custom_button.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/course/presentation/manager/course_view_cubit.dart';

class UpdateUrlButton extends StatelessWidget {
  const UpdateUrlButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: Colors.white,
      onPressed: () {
        var formKey = BlocProvider.of<CourseCubit>(context).formKey;
        if (formKey.currentState!.validate()) {
          BlocProvider.of<CourseCubit>(context).updateUrl();
        }
      },
      child: const CustomText(
        text: 'Update',
        color: AppColors.kAppBarColor,
      ),
    );
  }
}
