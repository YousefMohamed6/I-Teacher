import 'package:get_it/get_it.dart';
import 'package:iteacher/core/extentions/getit_extension.dart';
import 'package:iteacher/core/services/fatwaterak_service.dart';
import 'package:iteacher/core/services/firebase_auth_service.dart';
import 'package:iteacher/core/services/firebase_firestore_service.dart';
import 'package:iteacher/core/services/image_picker_service.dart';
import 'package:iteacher/features/payment/domain/use_cases/save_payment_status_use_case.dart';
import 'package:iteacher/features/register_teacher/data/repos/register_teacher_repo_impl.dart';
import 'package:iteacher/features/register_teacher/domain/repos/i_register_teacher.dart';
import 'package:iteacher/features/register_teacher/domain/use_cases/create_teacher_use_case.dart';
import 'package:iteacher/features/register_teacher/domain/use_cases/fetch_owner_data.dart';
import 'package:iteacher/features/register_teacher/domain/use_cases/pick_image_use_case.dart';
import 'package:iteacher/features/register_teacher/domain/use_cases/send_payment_request_teacher_use_case.dart';
import 'package:iteacher/features/register_teacher/presentation/manager/register_teacher_cubit.dart';

class RegisterTeacherService {
  final sl = GetIt.instance;
  void initDi() {
    sl.registerLazySingletonSafely<FirebaseFirestoreService>(
        () => FirebaseFirestoreService());
    sl.registerLazySingletonSafely<FirebaseAuthService>(
        () => FirebaseAuthService());
    sl.registerLazySingletonSafely<ImagePickerService>(
        () => ImagePickerService());
    sl.registerLazySingletonSafely<FawaterkService>(() => FawaterkService());
    sl.registerLazySingletonSafely<IRegisterTeacherRepo>(
      () => RegisterTeacherRepoImpl(
        sl<FirebaseFirestoreService>(),
        sl<FirebaseAuthService>(),
        sl<FawaterkService>(),
      ),
    );
    sl.registerLazySingletonSafely<SendPaymentRequestTeacherUseCase>(
      () => SendPaymentRequestTeacherUseCase(
        sl<IRegisterTeacherRepo>(),
      ),
    );
    sl.registerLazySingletonSafely<PickTeacherImageUseCase>(
      () => PickTeacherImageUseCase(
        sl(),
      ),
    );
    sl.registerLazySingletonSafely<CreateTeacherUseCase>(
      () => CreateTeacherUseCase(
        sl(),
      ),
    );
    sl.registerLazySingletonSafely<SavePaymentStatusUseCase>(
      () => SavePaymentStatusUseCase(
        sl(),
      ),
    );
    sl.registerLazySingletonSafely<CreateTeacherUseCase>(
      () => CreateTeacherUseCase(
        sl(),
      ),
    );
    sl.registerLazySingletonSafely<FetchOwnerDataUseCase>(
      () => FetchOwnerDataUseCase(
        sl(),
      ),
    );
    sl.registerFactorySafely<RegisterTeacherCubit>(
      () => RegisterTeacherCubit(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
  }
}
