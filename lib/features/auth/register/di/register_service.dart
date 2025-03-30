import 'package:get_it/get_it.dart';
import 'package:iteacher/core/extentions/getit_extension.dart';
import 'package:iteacher/core/services/firebase_auth_service.dart';
import 'package:iteacher/core/services/firebase_firestore_service.dart';
import 'package:iteacher/features/auth/register/data/repos/resgister_repo_impl.dart';
import 'package:iteacher/features/auth/register/domain/repos/i_register_repo.dart';
import 'package:iteacher/features/auth/register/domain/use_case/create_student_use_case.dart';
import 'package:iteacher/features/auth/register/domain/use_case/create_user_with_email_and_password.dart';
import 'package:iteacher/features/auth/register/presentation/manager/register_cubit.dart';

class RegisterService {
  final sl = GetIt.instance;

  void initDi() {
    sl.registerLazySingletonSafely<FirebaseFirestoreService>(
      () => FirebaseFirestoreService(),
    );
    sl.registerLazySingletonSafely<IRegisterRepo>(
      () => RegisterRepoImpl(sl()),
    );
    sl.registerLazySingletonSafely<FirebaseAuthService>(
      () => FirebaseAuthService(),
    );
    sl.registerLazySingletonSafely<CreateUserWithEmailAndPasswordUseCase>(
      () => CreateUserWithEmailAndPasswordUseCase(sl()),
    );
    sl.registerLazySingletonSafely<CreateStudentUseCase>(
      () => CreateStudentUseCase(sl()),
    );
    sl.registerFactorySafely<RegisterCubit>(
      () => RegisterCubit(
        sl(),
        sl(),
      ),
    );
  }
}
