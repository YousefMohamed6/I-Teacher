import 'package:iteacher/core/models/youtube/playlist_video_item/playlist_video_item.dart';
import 'package:iteacher/features/course/domain/repos/i_course_repo.dart';

class FetchPlaylistVideosUseCase {
  final ICourseRepo _courseRepo;
  FetchPlaylistVideosUseCase(this._courseRepo);
  Future<List<PlaylistVideo>> execute({required String playlistId}) async {
    final videos = await _courseRepo.getPlaylistVideos(playlistId: playlistId);
    return videos
        .where((video) => video.snippet.title != 'Private video')
        .toList();
  }
}
