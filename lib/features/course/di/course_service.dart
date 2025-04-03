import 'package:get_it/get_it.dart';
import 'package:iteacher/core/extentions/getit_extension.dart';
import 'package:iteacher/core/services/api_service.dart';
import 'package:iteacher/core/services/firebase_firestore_service.dart';
import 'package:iteacher/core/services/youtube_service.dart';
import 'package:iteacher/features/course/data/repos/course_repo_impl.dart';
import 'package:iteacher/features/course/domain/repos/i_course_repo.dart';
import 'package:iteacher/features/course/domain/use_case/fetch_all_playlists_use_case.dart';
import 'package:iteacher/features/course/domain/use_case/fetch_playlist_videos_use_case.dart';
import 'package:iteacher/features/course/domain/use_case/get_student_data_use_case.dart';
import 'package:iteacher/features/course/domain/use_case/get_teacher_data_use_case.dart';
import 'package:iteacher/features/course/domain/use_case/validate_subscription_use_case.dart';
import 'package:iteacher/features/course/presentation/manager/course_cubit.dart';

class CourseService {
  final sl = GetIt.instance;

  void initDi() {
    sl.registerLazySingletonSafely<FirebaseFirestoreService>(
      () => FirebaseFirestoreService(),
    );
    sl.registerLazySingletonSafely<ApiService>(
      () => ApiService(),
    );
    sl.registerLazySingletonSafely<YouTubeService>(
      () => YouTubeService(),
    );
    sl.registerLazySingletonSafely<ICourseRepo>(
      () => CourseRepoImpl(
        firebaseFirestoreService: sl(),
        youtubeService: sl(),
      ),
    );
    sl.registerLazySingletonSafely<GetStudentDataUseCase>(
      () => GetStudentDataUseCase(sl()),
    );
    sl.registerLazySingletonSafely<GetTeacherDataUseCase>(
      () => GetTeacherDataUseCase(sl()),
    );
    sl.registerLazySingletonSafely<FetchAllPlaylistsUseCase>(
      () => FetchAllPlaylistsUseCase(sl()),
    );
    sl.registerLazySingletonSafely<FetchPlaylistVideosUseCase>(
      () => FetchPlaylistVideosUseCase(sl()),
    );
    sl.registerLazySingletonSafely<ValidateSubscriptionUseCase>(
      () => ValidateSubscriptionUseCase(
        firebaseFirestoreService: sl(),
        apiService: sl(),
      ),
    );
    sl.registerFactorySafely<CourseCubit>(
      () => CourseCubit(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
  }
}
