import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/core/extentions/theme_extension.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
import 'package:iteacher/core/utils/constants/app_font_sizes.dart';
import 'package:iteacher/core/utils/helper/toast_message.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/course/presentation/manager/sign_learning_cubit.dart';
import 'package:iteacher/generated/app_localizations.dart';

class SignFlashcardsView extends StatelessWidget {
  static const String routeName = '/sign-learning';
  const SignFlashcardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.of(context)!.sign_language_support,
        ),
      ),
      body: BlocConsumer<SignLearningCubit, SignLearningState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (msg) => ToastMessage.show(msg: msg),
            failure: (msg) => ToastMessage.show(msg: msg),
          );
        },
        builder: (context, state) {
          final cubit = context.read<SignLearningCubit>();
          final card = cubit.flashcards[cubit.currentIndex];

          return Padding(
            padding: EdgeInsets.all(AppDimensions.kPadding20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary.withAlpha(25),
                    borderRadius: BorderRadius.circular(AppDimensions.kRadius20),
                    border: Border.all(color: context.colorScheme.primary),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: card['word']!,
                        fontSize: AppFontSizes.s40,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: AppDimensions.kPadding10),
                      CustomText(
                        text: card['hint']!,
                        fontSize: AppFontSizes.s16,
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppDimensions.kPadding40),
                if (state is Loading)
                  const CircularProgressIndicator()
                else
                  ElevatedButton.icon(
                    onPressed: () => cubit.validateSign(),
                    icon: const Icon(Icons.camera_alt),
                    label: CustomText(text: AppLocalizations.of(context)!.translate_signs),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: AppDimensions.kPadding30, vertical: AppDimensions.kPadding14),
                    ),
                  ),
                SizedBox(height: AppDimensions.kPadding20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: cubit.currentIndex > 0 ? () => cubit.previousCard() : null,
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    CustomText(
                      text: '${cubit.currentIndex + 1} / ${cubit.flashcards.length}',
                      fontSize: AppFontSizes.s18,
                    ),
                    IconButton(
                      onPressed: cubit.currentIndex < cubit.flashcards.length - 1
                          ? () => cubit.nextCard()
                          : null,
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
