import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_icon_button.dart';
import 'package:mrjoo/features/course/presentation/manager/course_view_cubit.dart';
import 'package:mrjoo/features/course/presentation/views/course_view.dart';

class ToCourseButton extends StatelessWidget {
  const ToCourseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: const Icon(Icons.navigate_next),
      iconSize: 30,
      onPressed: () {
        BlocProvider.of<CourseCubit>(context).fetchUrl();
        Navigator.pushNamed(context, CourseView.routeView);
      },
    );
  }
}
