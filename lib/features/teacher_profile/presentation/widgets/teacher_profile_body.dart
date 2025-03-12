import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/core/utils/helper/show_message.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/profile/data/model/teacher_model.dart';
import 'package:mrjoo/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';
import 'package:mrjoo/features/teacher_profile/presentation/widgets/teacher_profile_form.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class TeacherProfileBody extends StatelessWidget {
  const TeacherProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: BlocConsumer<TeacherProfileCubit, TeacherProfileState>(
        buildWhen: (previous, current) =>
            current is UpdateUI<TeacherModel> || current is Loading,
        listener: (context, state) {
          if (state is Success<TeacherModel>) {
            ShowMessage.show(context,
                msg: AppLocalizations.of(context)!.success);
          } else if (state is Failure) {
            ShowMessage.show(context, msg: AppLocalizations.of(context)!.fail);
          }
        },
        builder: (context, state) => state.when(
          initial: () => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (model) => const TeacherProfileForm(),
          updateUI: () => const TeacherProfileForm(),
          failure: (message) => Center(
            child: CustomText(
              text: message,
              fontSize: 16.sp,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
