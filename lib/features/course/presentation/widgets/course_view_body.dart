import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iteacher/core/exceptions/expired_subscription_exception.dart';
import 'package:iteacher/core/utils/helper/show_message.dart';
import 'package:iteacher/core/widgets/background.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/course/presentation/manager/course_cubit.dart';
import 'package:iteacher/features/course/presentation/widgets/playlists_list_view.dart';
import 'package:iteacher/features/student_data/presentation/views/student_view.dart';
import 'package:iteacher/l10n.dart';

class CourseViewBody extends StatelessWidget {
  const CourseViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: BlocConsumer<CourseCubit, CourseState>(
        listener: (context, state) {
          if (state is Failure<String>) {
            ShowMessage.show(context, msg: AppLocalizations.of(context)!.fail);
          }
          if (state is Failure<ExpiredSubscriptionException>) {
            context.goNamed(StudentView.routeName);
          }
        },
        // buildWhen: (previous, current) =>
        //     current is Loading<List<Playlist>> ||
        //     current is Success<List<Playlist>> ||
        //     current is Failure<ExpiredSubscriptionException>,
        builder: (context, state) {
          return state.when(
            initial: () => SizedBox(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            success: (data) => PlayListsListView(),
            failure: (message) => Center(
              child: CustomText(
                text: AppLocalizations.of(context)!.expired_subscription,
              ),
            ),
          );
        },
      ),
    );
  }
}
