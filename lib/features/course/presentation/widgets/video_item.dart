import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/models/youtube/playlist_video_item/playlist_video_item.dart';
import 'package:iteacher/core/widgets/network_image.dart';
import 'package:iteacher/features/course/presentation/manager/course_cubit.dart';

class CustomVideoItem extends StatelessWidget {
  const CustomVideoItem({super.key, required this.video});
  final PlaylistVideo video;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .read<CourseCubit>()
            .selectVideo(video.snippet.resourceId.videoId);
      },
      child: Card(
        child: ListTile(
          trailing: CustomNetworkImage(
            imageUrl: video.snippet.thumbnails.thumbnailsDefault?.url ?? '',
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          contentPadding: EdgeInsets.zero,
          title: Text(video.snippet.title),
          subtitle: Text(
            video.snippet.description,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 2,
          ),
        ),
      ),
    );
  }
}
