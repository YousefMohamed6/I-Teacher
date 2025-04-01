import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iteacher/core/models/youtube/playlist_item/playlist_item.dart';
import 'package:iteacher/features/course/presentation/views/video_player_view.dart';

class PlaylistWidget extends StatelessWidget {
  const PlaylistWidget({super.key, required this.playlist});

  final Playlist playlist;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        context.pushNamed(VideoPlayerView.routeName, extra: playlist.id);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: playlist.snippet.thumbnails.medium.height.toDouble(),
                width: playlist.snippet.thumbnails.medium.width.toDouble(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.r),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(playlist.snippet.thumbnails.medium.url),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.playlist_play,
                        size: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        playlist.snippet.localized.title ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
