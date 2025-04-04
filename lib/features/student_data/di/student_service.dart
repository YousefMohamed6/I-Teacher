import 'package:get_it/get_it.dart';
import 'package:iteacher/core/extentions/getit_extension.dart';
import 'package:iteacher/core/services/firebase_firestore_service.dart';
import 'package:iteacher/core/services/image_picker_service.dart';
import 'package:iteacher/features/student_data/data/repos/student_repo_impl.dart';
import 'package:iteacher/features/student_data/domain/repos/i_student_repo.dart';
import 'package:iteacher/features/student_data/domain/use_cases/get_teachers_ids_use_case.dart';
import 'package:iteacher/features/student_data/domain/use_cases/pick_student_image_use_case.dart';
import 'package:iteacher/features/student_data/presentation/manager/student_cubit.dart';

class StudentService {
  final sl = GetIt.instance;
  void initDi() {
    sl.registerLazySingletonSafely<FirebaseFirestoreService>(
      () => FirebaseFirestoreService(),
    );
    sl.registerLazySingletonSafely<ImagePickerService>(
      () => ImagePickerService(),
    );
    sl.registerLazySingletonSafely<IStudentRepo>(
      () => StudentRepoImpl(
        firebaseFirestoreService: sl(),
      ),
    );
    sl.registerLazySingletonSafely<GetTeachersIdsUseCase>(
      () => GetTeachersIdsUseCase(sl()),
    );
    sl.registerLazySingletonSafely<PickStudentImageUseCase>(
      () => PickStudentImageUseCase(sl()),
    );
    sl.registerFactorySafely<StudentCubit>(
      () => StudentCubit(
        sl(),
        sl(),
      ),
    );
  }
}
