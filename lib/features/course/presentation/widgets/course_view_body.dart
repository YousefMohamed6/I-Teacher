import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/utils/helper/show_message.dart';
import 'package:iteacher/core/widgets/background.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/course/presentation/manager/course_cubit.dart';
import 'package:iteacher/features/course/presentation/widgets/playlist_items.dart';
import 'package:iteacher/l10n.dart';

class CourseViewBody extends StatelessWidget {
  const CourseViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: BlocConsumer<CourseCubit, CourseState>(
        listener: (context, state) {
          if (state is Failure) {
            ShowMessage.show(context, msg: AppLocalizations.of(context)!.fail);
          }
        },
        builder: (context, state) {
          return state.when(
            initial: () => SizedBox(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            success: (data) => PlayListItems(),
            failure: (message) => Center(
              child: CustomText(
                text: AppLocalizations.of(context)!.no_data,
              ),
            ),
          );
        },
      ),
    );
  }
}
