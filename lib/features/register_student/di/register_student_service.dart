import 'package:get_it/get_it.dart';
import 'package:iteacher/core/extentions/getit_extension.dart';
import 'package:iteacher/core/services/firebase_firestore_service.dart';
import 'package:iteacher/core/services/image_picker_service.dart';
import 'package:iteacher/features/register_student/data/repos/register_student_repo_impl.dart';
import 'package:iteacher/features/register_student/domain/repos/i_register_student_repo.dart';
import 'package:iteacher/features/register_student/domain/use_cases/get_teachers_ids_use_case.dart';
import 'package:iteacher/features/register_student/domain/use_cases/pick_student_image_use_case.dart';
import 'package:iteacher/features/register_student/presentation/manager/register_student_cubit.dart';

class RegisterStudentService {
  final sl = GetIt.instance;
  void initDi() {
    sl.registerLazySingletonSafely<FirebaseFirestoreService>(
      () => FirebaseFirestoreService(),
    );
    sl.registerLazySingletonSafely<ImagePickerService>(
      () => ImagePickerService(),
    );
    sl.registerLazySingletonSafely<IRegisterStudentRepo>(
      () => RegisterStudentRepoImpl(
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
