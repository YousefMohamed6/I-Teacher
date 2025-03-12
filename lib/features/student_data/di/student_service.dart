import 'package:get_it/get_it.dart';
import 'package:mrjoo/core/extentions/getit_extension.dart';
import 'package:mrjoo/core/services/firebase_firestore_service.dart';
import 'package:mrjoo/features/student_data/data/repos/student_repo_impl.dart';
import 'package:mrjoo/features/student_data/domain/repos/i_student_repo.dart';
import 'package:mrjoo/features/student_data/domain/use_cases/get_teachers_ids_use_case.dart';
import 'package:mrjoo/features/student_data/presentation/manager/student_cubit.dart';

class StudentService {
  final sl = GetIt.instance;
  void initDi() {
    sl.registerLazySingletonSafely<FirebaseFirestoreService>(
      () => FirebaseFirestoreService(),
    );
    sl.registerLazySingletonSafely<IStudentRepo>(
      () => StudentRepoImpl(
        firebaseFirestoreService: sl(),
      ),
    );
    sl.registerLazySingletonSafely<GetTeachersIdsUseCase>(
      () => GetTeachersIdsUseCase(
        sl(),
      ),
    );
    sl.registerFactorySafely<StudentCubit>(
      () => StudentCubit(
        sl(),
      ),
    );
  }
}
