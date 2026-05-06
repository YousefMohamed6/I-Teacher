import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
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
          initial: () => const SizedBox.shrink(),
          loading: () => Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          ),
          error: (message) => Center(
            child: CustomText(
              text: message,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          success: (data) => Background(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.kPadding20,
                vertical: AppDimensions.kPadding16,
              ),
              child: CustomBackground(
                data: data,
              ),
            ),
          ),
        );
      },
    );
  }
}
