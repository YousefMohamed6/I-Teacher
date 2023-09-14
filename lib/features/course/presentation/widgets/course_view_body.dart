import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/show_message.dart';
import 'package:mrjoo/features/course/data/course_view_cubit/course_view_cubit.dart';
import 'package:mrjoo/features/payment/presentation/views/widgets/webview_body.dart';

class CourseViewBody extends StatelessWidget {
  const CourseViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseCubit, CourseState>(
      listener: (context, state) {
        if (state is UpdateSucees) {
          Navigator.pop(context);
          ShowMessage.show(context, msg: 'Success');
        } else if (state is UpdateFailure) {
          Navigator.pop(context);
          ShowMessage.show(context, msg: 'Faild');
        } else if (state is SignOut) {
          ShowMessage.show(context, msg: 'Sign out');
          Navigator.pop(context);
        } else {
           BlocProvider.of<CourseCubit>(context).fetchUrl();
        }
      },
      builder: (context, state) {
        var url = BlocProvider.of<CourseCubit>(context).fetchUrl();
        return WebViewBody(url: url);
      },
    );
  }
}
