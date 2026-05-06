import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/models/youtube/playlist_video_item/playlist_video_item.dart';
import 'package:iteacher/core/extentions/theme_extension.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
import 'package:iteacher/core/utils/constants/app_font_sizes.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/course/presentation/manager/playlists_cubit.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({super.key, required this.video});
  final PlaylistVideo video;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: AppDimensions.kElevation1,
      margin: EdgeInsets.only(bottom: AppDimensions.kPadding12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.kRadius12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDimensions.kRadius12),
        onTap: () {
          BlocProvider.of<PlaylistsCubit>(context).showRewardedAd();
          context
              .read<PlaylistsCubit>()
              .selectVideo(video.snippet.resourceId.videoId);
        },
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.kPadding12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppDimensions.kRadius8),
                child: Image.network(
                  video.snippet.thumbnails.high?.url ?? '',
                  width: 100,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 100,
                    height: 60,
                    color: context.colorScheme.primary.withValues(alpha: 0.1),
                    child: const Icon(Icons.video_library_rounded),
                  ),
                ),
              ),
              SizedBox(width: AppDimensions.kPadding16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: video.snippet.title,
                      fontSize: AppFontSizes.s14,
                      fontWeight: FontWeight.w600,
                      maxLines: 2,
                    ),
                    SizedBox(height: AppDimensions.kPadding4),
                    CustomText(
                      text: video.snippet.channelTitle,
                      fontSize: AppFontSizes.s12,
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
