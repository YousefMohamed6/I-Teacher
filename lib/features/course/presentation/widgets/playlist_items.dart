import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/core/models/youtube/playlist_item/playlist_item.dart';
import 'package:iteacher/features/course/presentation/manager/course_cubit.dart';
import 'package:iteacher/features/course/presentation/widgets/playlist_item.dart';

class PlayListItems extends StatelessWidget {
  const PlayListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CourseCubit>();
    return BlocBuilder<CourseCubit, CourseState>(
      buildWhen: (previous, current) => current is Success<List<Playlist>>,
      builder: (context, state) {
        return ListView.separated(
          padding: EdgeInsets.all(8.sp),
          separatorBuilder: (context, index) => SizedBox(
            height: 16.h,
          ),
          itemCount: cubit.playLists.length,
          itemBuilder: (_, index) => PlaylistWidget(
            playlist: cubit.playLists[index],
          ),
        );
      },
    );
  }
}
