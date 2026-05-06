import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
import 'package:iteacher/core/utils/constants/app_font_sizes.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/course/presentation/manager/playlists_cubit.dart';
import 'package:iteacher/features/course/presentation/widgets/videos_list_view.dart';
import 'package:iteacher/generated/app_localizations.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerView extends StatelessWidget {
  const VideoPlayerView({super.key, required this.playListId});
  static String routeName = '/VideoPlayerView';
  final String playListId;
  @override
  Widget build(BuildContext context) {
    context.read<PlaylistsCubit>().fetchPlaylistVideos(playListId: playListId);
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.of(context)!.video_player,
          fontSize: AppFontSizes.s20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: BlocBuilder<PlaylistsCubit, PlaylistsState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (data) => SingleChildScrollView(
              child: Column(
                children: [
                  YoutubePlayer(
                    controller: context.read<PlaylistsCubit>().controller!,
                    showVideoProgressIndicator: true,
                  ),
                  SizedBox(height: AppDimensions.kPadding16),
                  const VideosListView(),
                ],
              ),
            ),
            failure: (message) => Center(child: CustomText(text: message)),
            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }
}
