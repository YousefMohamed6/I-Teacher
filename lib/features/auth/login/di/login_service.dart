import 'package:get_it/get_it.dart';
import 'package:iteacher/core/extentions/getit_extension.dart';
import 'package:iteacher/core/services/firebase_firestore_service.dart';
import 'package:iteacher/features/auth/login/data/repos/login_repo_impl.dart';
import 'package:iteacher/features/auth/login/domain/repo/i_login_repo.dart';
import 'package:iteacher/features/auth/login/domain/use_cases/get_use_data_use_case.dart';
import 'package:iteacher/features/auth/login/domain/use_cases/save_user_email_use_case.dart';
import 'package:iteacher/features/auth/login/domain/use_cases/save_user_role_use_case.dart';
import 'package:iteacher/features/auth/login/presentation/manager/login_cubit.dart';

class LoginService {
  final sl = GetIt.I;
  void initDi() {
    sl.registerLazySingletonSafely<FirebaseFirestoreService>(
      () => FirebaseFirestoreService(),
    );
    sl.registerLazySingletonSafely<ILoginRepo>(
      () => LoginRepoImpl(firebaseFirestoreService: sl()),
    );
    sl.registerLazySingletonSafely<GetUserDataUseCase>(
      () => GetUserDataUseCase(sl()),
    );
    sl.registerLazySingletonSafely<SaveUserRoleUseCase>(
      () => SaveUserRoleUseCase(sl()),
    );
    sl.registerLazySingletonSafely<SaveUserEmailUseCase>(
      () => SaveUserEmailUseCase(sl()),
    );
    sl.registerFactorySafely<LoginCubit>(
      () => LoginCubit(
        sl(),
        sl(),
        sl(),
      ),
    );
  }
}
