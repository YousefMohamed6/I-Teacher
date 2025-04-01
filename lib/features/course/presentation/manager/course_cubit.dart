import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iteacher/core/models/youtube/playlist_item/playlist_item.dart';
import 'package:iteacher/core/models/youtube/playlist_video_item/playlist_video_item.dart';
import 'package:iteacher/core/services/sf_service.dart';
import 'package:iteacher/core/utils/constants/sf_keys.dart';
import 'package:iteacher/features/course/domain/use_case/fetch_all_playlists_use_case.dart';
import 'package:iteacher/features/course/domain/use_case/fetch_playlist_videos_use_case.dart';
import 'package:iteacher/features/course/domain/use_case/get_student_data_use_case.dart';
import 'package:iteacher/features/course/domain/use_case/get_teacher_data_use_case.dart';
import 'package:iteacher/features/student_data/data/model/student_model.dart';
import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'course_cubit.freezed.dart';
part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final GetTeacherDataUseCase _getTeacherDataUseCase;
  final GetStudentDataUseCase _getStudentDataUseCase;
  final FetchAllPlaylistsUseCase _fetchAllPlaylistsUseCase;
  final FetchPlaylistVideosUseCase _fetchPlaylistVideosUseCase;
  CourseCubit(
    this._getTeacherDataUseCase,
    this._getStudentDataUseCase,
    this._fetchAllPlaylistsUseCase,
    this._fetchPlaylistVideosUseCase,
  ) : super(CourseState.initial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late StudentModel student;
  List<Playlist> playLists = [];
  List<PlaylistVideo> videos = [];
  YoutubePlayerController? controller;

  Future<String> fetchChannelId() async {
    emit(CourseState.loading());
    try {
      emit(CourseState.loading());
      final studentEmail = await getStudentEmail();
      student = await getStudentData(studentEmail: studentEmail);
      final teacher = await getTeacherData(teacherId: student.teacherId);
      emit(CourseState<String>.success(teacher.channalId));
      return teacher.channalId;
    } catch (e) {
      emit(CourseState.failure(e.toString()));
      return '';
    }
  }

  Future<String> getStudentEmail() async {
    return await SharedPreferencesService.getString(SfKeys.userEmail) ?? '';
  }

  Future<TeacherModel> getTeacherData({required String teacherId}) async {
    return await _getTeacherDataUseCase.execute(teacherId: teacherId);
  }

  Future<StudentModel> getStudentData({required String studentEmail}) async {
    return await _getStudentDataUseCase.execute(studentEmail: studentEmail);
  }

  Future<void> fetchAllPlaylists() async {
    try {
      emit(CourseState.loading());
      final channelId = await fetchChannelId();
      playLists = await _fetchAllPlaylistsUseCase.execute(channelId: channelId);
      emit(CourseState<List<Playlist>>.success(playLists));
    } catch (e) {
      emit(CourseState.failure(e.toString()));
    }
  }

  void initController() {
    controller = YoutubePlayerController(
      initialVideoId: videos.first.snippet.resourceId.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  Future<void> fetchPlaylistVideos({required String playListId}) async {
    try {
      emit(CourseState.loading());
      videos =
          await _fetchPlaylistVideosUseCase.execute(playlistId: playListId);
      initController();
      emit(CourseState<List<PlaylistVideo>>.success(videos));
    } catch (e) {
      emit(CourseState.failure(e.toString()));
    }
  }

  void selectVideo(String videoId) {
    emit(CourseState.loading());
    controller?.load(videoId);
    emit(CourseState<String>.success(videoId));
  }

  @override
  Future<void> close() {
    controller?.dispose();
    return super.close();
  }
}
