import 'package:get_it/get_it.dart';
import 'package:mrjoo/core/extentions/getit_extension.dart';
import 'package:mrjoo/core/services/firebase_firestore_service.dart';
import 'package:mrjoo/features/course/data/repos/course_repo_impl.dart';
import 'package:mrjoo/features/course/domain/repos/I_course_repo.dart';
import 'package:mrjoo/features/course/domain/use_case/get_student_data_use_case.dart';
import 'package:mrjoo/features/course/domain/use_case/get_teacher_data_use_case.dart';
import 'package:mrjoo/features/course/presentation/manager/course_cubit.dart';

class CourseService {
  final sl = GetIt.instance;

  void initDi() {
    sl.registerLazySingletonSafely<FirebaseFirestoreService>(
      () => FirebaseFirestoreService(),
    );
    sl.registerLazySingletonSafely<ICourseRepo>(
      () => CourseRepoImpl(
        firebaseFirestoreService: sl(),
      ),
    );
    sl.registerLazySingletonSafely<GetStudentDataUseCase>(
      () => GetStudentDataUseCase(sl()),
    );
    sl.registerLazySingletonSafely<GetTeacherDataUseCase>(
      () => GetTeacherDataUseCase(sl()),
    );
    sl.registerLazySingletonSafely<CourseCubit>(
      () => CourseCubit(sl(), sl()),
    );
  }
}
