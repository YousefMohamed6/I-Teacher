import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mrjoo/core/services/show_message.dart';
import 'package:mrjoo/core/widgets/webview_body.dart';
import 'package:mrjoo/features/course/presentation/manager/course_view_cubit.dart';

class CourseViewBody extends StatelessWidget {
  const CourseViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseCubit, CourseState>(
      listener: (context, state) {
        if (state is UpdateSucees) {
          context.pop();
          ShowMessage.show(context, msg: 'Success');
        } else if (state is UpdateFailure) {
          context.pop();
          ShowMessage.show(context, msg: 'Faild');
        } else if (state is CourseInitial) {
          BlocProvider.of<CourseCubit>(context).setState();
        }
      },
      builder: (context, state) {
        if (State is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Success) {
          return WebViewBody(url: state.url);
        } else {
          return WebViewBody(url: BlocProvider.of<CourseCubit>(context).url);
        }
      },
    );
  }
}
