import 'package:get_it/get_it.dart';
import 'package:iteacher/core/extentions/getit_extension.dart';
import 'package:iteacher/core/services/fatwaterak_service.dart';
import 'package:iteacher/core/services/firebase_firestore_service.dart';
import 'package:iteacher/features/payment/data/repos/payment_repo_impl.dart';
import 'package:iteacher/features/payment/domain/repos/i_payment_repo.dart';
import 'package:iteacher/features/payment/domain/use_cases/add_student_use_case.dart';
import 'package:iteacher/features/payment/domain/use_cases/get_teacher_data_use_case.dart';
import 'package:iteacher/features/payment/domain/use_cases/save_success_payment.dart';
import 'package:iteacher/features/payment/domain/use_cases/send_payment_request.dart';
import 'package:iteacher/features/payment/presentation/manager/payment_cubit.dart';

class PaymentService {
  final sl = GetIt.instance;
  void initDi() {
    sl.registerLazySingletonSafely<FawaterkService>(
      () => FawaterkService(),
    );
    sl.registerLazySingletonSafely<FirebaseFirestoreService>(
      () => FirebaseFirestoreService(),
    );
    sl.registerLazySingletonSafely<IPaymentRepo>(
      () => PaymentRepoImpl(
        fawaterkService: sl(),
        firebaseFirestoreService: sl(),
      ),
    );
    sl.registerLazySingletonSafely<SendPaymentRequestUseCase>(
      () => SendPaymentRequestUseCase(sl()),
    );
    sl.registerLazySingletonSafely<GetTeacherDataUseCase>(
      () => GetTeacherDataUseCase(sl()),
    );
    sl.registerLazySingletonSafely<SavePaymentStatusUseCase>(
      () => SavePaymentStatusUseCase(sl()),
    );
    sl.registerLazySingletonSafely<AddStudentUseCase>(
      () => AddStudentUseCase(sl()),
    );
    sl.registerFactorySafely<PaymentCubit>(
      () => PaymentCubit(
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
  }
}
