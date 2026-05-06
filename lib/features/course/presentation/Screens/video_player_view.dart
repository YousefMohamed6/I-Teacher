import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/models/youtube/playlist_video_item/playlist_video_item.dart';
import 'package:iteacher/core/utils/constants/app_fonts.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/course/presentation/manager/course_cubit.dart';
import 'package:iteacher/features/course/presentation/widgets/videos_list_view.dart';
import 'package:iteacher/generated/app_localizations.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerView extends StatelessWidget {
  const VideoPlayerView({super.key});
  static const String routeName = '/VideoPlayer';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.of(context)!.videos,
          fontSize: 24,
          fontFamily: AppFonts.kPacificoFont,
          color: Colors.white,
        ),
      ),
      body: BlocBuilder<CourseCubit, CourseState>(
        buildWhen: (previous, current) =>
            current is Success<List<PlaylistVideo>> ||
            current is Loading<List<PlaylistVideo>>,
        builder: (context, state) {
          return state.when(
            initial: () => SizedBox(),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
            success: (data) => YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: context.read<CourseCubit>().controller!,
              ),
              builder: (_, player) {
                return Column(
                  children: [
                    player,
                    SizedBox(height: 8),
                    VideosListView(),
                  ],
                );
              },
            ),
            failure: (message) => Center(
              child: Text(message),
            ),
          );
        },
      ),
    );
  }
}
