import 'package:iteacher/core/models/youtube/playlist_item/playlist_item.dart';
import 'package:iteacher/core/models/youtube/playlist_video_item/playlist_video_item.dart';
import 'package:iteacher/features/student_data/data/model/student_model.dart';
import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';

abstract class ICourseRepo {
  Future<StudentModel> getStudentData({required String studentEmail});
  Future<TeacherModel> getTeacherData({required String teacherId});
  Future<List<PlaylistVideo>> getPlaylistVideos({
    required String playlistId,
  });
  Future<List<Playlist>> getAllPlaylists({
    required String channelId,
  });
}
