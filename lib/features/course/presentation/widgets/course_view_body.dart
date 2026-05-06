import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iteacher/core/utils/helper/toast_message.dart';
import 'package:iteacher/core/widgets/background.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/course/presentation/manager/playlists_cubit.dart';
import 'package:iteacher/features/course/presentation/widgets/playlists_list_view.dart';
import 'package:iteacher/features/register_student/presentation/Screens/student_view.dart';
import 'package:iteacher/generated/app_localizations.dart';

class CourseViewBody extends StatelessWidget {
  const CourseViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: BlocConsumer<PlaylistsCubit, PlaylistsState>(
        listener: (context, state) {
          if (state is ExpiredSubscription) {
            context.goNamed(StudentView.routeName);
          } else if (state is PlaylistsFailure) {
            ToastMessage.show(msg: AppLocalizations.of(context)!.fail);
          }
        },
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            success: (data) => const PlayListsListView(),
            failure: (message) => Center(
              child: CustomText(
                text: AppLocalizations.of(context)!.fail,
              ),
            ),
            expiredSubscription: () => Center(
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
