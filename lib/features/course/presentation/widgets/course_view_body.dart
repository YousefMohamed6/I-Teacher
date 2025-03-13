import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/helper/show_message.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/core/widgets/webview_body.dart';
import 'package:mrjoo/features/course/presentation/manager/course_cubit.dart';
import 'package:mrjoo/l10n.dart';

class CourseViewBody extends StatelessWidget {
  const CourseViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseCubit, CourseState>(
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
          success: (url) => WebViewBody(url: url),
          failure: (message) => Center(
            child: CustomText(
              text: AppLocalizations.of(context)!.no_data,
            ),
          ),
        );
      },
    );
  }
}
