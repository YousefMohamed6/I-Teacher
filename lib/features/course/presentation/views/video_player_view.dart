import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/models/youtube/playlist_video_item/playlist_video_item.dart';
import 'package:iteacher/core/utils/constants/app_fonts.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/core/widgets/network_image.dart';
import 'package:iteacher/features/course/presentation/manager/course_cubit.dart';
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
                controller: context.read<CourseCubit>().controller,
              ),
              builder: (_, player) {
                return Column(
                  children: [
                    player,
                    SizedBox(height: 8),
                    Videos(),
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

class Videos extends StatelessWidget {
  const Videos({super.key});

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
      child: Expanded(
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
      ),
    );
  }
}
