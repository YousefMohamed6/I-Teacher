import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/features/course/presentation/manager/course_cubit.dart';
import 'package:iteacher/features/course/presentation/widgets/video_item.dart';

class VideosListView extends StatelessWidget {
  const VideosListView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CourseCubit>();
    return Expanded(
      child: ListView.builder(
        itemCount: cubit.videos.length,
        itemBuilder: (_, index) => CustomVideoItem(
          video: cubit.videos[index],
        ),
      ),
    );
  }
}
