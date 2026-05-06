import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iteacher/core/extentions/theme_extension.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
import 'package:iteacher/core/utils/constants/app_font_sizes.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/course/presentation/manager/playlists_cubit.dart';
import 'package:iteacher/features/course/presentation/Screens/video_player_view.dart';
import 'package:iteacher/core/models/youtube/playlist_item/playlist_item.dart';

class PlaylistItem extends StatelessWidget {
  const PlaylistItem({super.key, required this.playList});
  final Playlist playList;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: AppDimensions.kElevation2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.kRadius12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDimensions.kRadius12),
        onTap: () {
          BlocProvider.of<PlaylistsCubit>(context).showRewardedAd();
          context.pushNamed(VideoPlayerView.routeName, extra: playList.id);
        },
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.kPadding12),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: context.colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppDimensions.kRadius8),
                ),
                child: Icon(
                  Icons.playlist_play_rounded,
                  color: context.colorScheme.primary,
                  size: AppDimensions.kIcon32,
                ),
              ),
              SizedBox(width: AppDimensions.kPadding16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: playList.snippet.title,
                      fontSize: AppFontSizes.s16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: AppDimensions.kPadding4),
                    CustomText(
                      text: playList.snippet.description,
                      fontSize: AppFontSizes.s12,
                      color: context.colorScheme.onSurfaceVariant,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: AppDimensions.kIcon16,
                color: context.colorScheme.outline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
