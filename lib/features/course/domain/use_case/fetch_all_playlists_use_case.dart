import 'package:iteacher/core/models/youtube/playlist_item/playlist_item.dart';
import 'package:iteacher/features/course/domain/repos/i_course_repo.dart';

class FetchAllPlaylistsUseCase {
  final ICourseRepo repo;
  FetchAllPlaylistsUseCase(this.repo);
  Future<List<Playlist>> execute({required String channelId}) async =>
      await repo.getAllPlaylists(channelId: channelId);
}
