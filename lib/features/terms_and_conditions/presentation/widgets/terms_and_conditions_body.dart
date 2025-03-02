import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/features/terms_and_conditions/presentation/widgets/custom_background.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/terms_and_conditions/presentation/manager/terms_and_conditions_cubit.dart';

class TermsAndConditionsBody extends StatelessWidget {
  const TermsAndConditionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TermsAndConditionsCubit, TermsAndConditionsState>(
      builder: (context, state) {
        return state.when(
          initial: () => SizedBox(),
          loading: () => const Center(
            child: CircularProgressIndicator(
              color: AppColors.kPrimryColor,
            ),
          ),
          error: (message) => Center(
            child: CustomText(
              text: message,
              fontSize: 16.sp,
              color: Colors.red,
            ),
          ),
          success: (data) => Background(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 16.h),
                  CustomBackground(
                    data: data,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
