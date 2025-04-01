import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/core/widgets/background.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/terms_and_conditions/presentation/manager/terms_and_conditions_cubit.dart';
import 'package:iteacher/features/terms_and_conditions/presentation/widgets/custom_background.dart';

class TermsAndConditionsBody extends StatelessWidget {
  const TermsAndConditionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TermsAndConditionsCubit, TermsAndConditionsState>(
      builder: (context, state) {
        return state.when(
          initial: () => SizedBox(),
          loading: () => Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
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
