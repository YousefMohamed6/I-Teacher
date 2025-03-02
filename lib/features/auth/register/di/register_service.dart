import 'package:get_it/get_it.dart';
import 'package:mrjoo/core/extentions/getit_extension.dart';
import 'package:mrjoo/core/services/firebase_auth_service.dart';
import 'package:mrjoo/features/auth/register/domain/use_case/create_user_with_email_and_password.dart';
import 'package:mrjoo/features/auth/register/domain/use_case/sign_in_use_google.dart';
import 'package:mrjoo/features/auth/register/presentation/manager/register_cubit.dart';

class RegisterService {
  final sl = GetIt.instance;

  void initDi() {
    sl.registerLazySingletonSafely<FirebaseAuthService>(
      () => FirebaseAuthService(),
    );
    sl.registerLazySingletonSafely<SignInUseGoogleUseCase>(
      () => SignInUseGoogleUseCase(sl()),
    );

    sl.registerLazySingletonSafely<CreateUserWithEmailAndPasswordUseCase>(
      () => CreateUserWithEmailAndPasswordUseCase(sl()),
    );
    sl.registerLazySingletonSafely<RegisterCubit>(
      () => RegisterCubit(
        sl(),
        sl(),
      ),
    );
  }
}
