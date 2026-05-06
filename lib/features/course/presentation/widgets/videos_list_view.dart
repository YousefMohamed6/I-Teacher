import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
import 'package:iteacher/features/course/presentation/manager/playlists_cubit.dart';
import 'package:iteacher/features/course/presentation/widgets/video_item.dart';

class VideosListView extends StatelessWidget {
  const VideosListView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PlaylistsCubit>();
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.kPadding16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cubit.videos.length,
      itemBuilder: (context, index) {
        return VideoItem(
          video: cubit.videos[index],
        );
      },
    );
  }
}
