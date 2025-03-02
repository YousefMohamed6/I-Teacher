import 'package:get_it/get_it.dart';
import 'package:mrjoo/core/extentions/getit_extension.dart';
import 'package:mrjoo/core/services/fatwaterak_service.dart';
import 'package:mrjoo/core/services/firebase_service.dart';
import 'package:mrjoo/features/payment/data/repos/payment_repo_impl.dart';
import 'package:mrjoo/features/payment/domain/repos/i_payment_repo.dart';
import 'package:mrjoo/features/payment/domain/use_cases/get_course_price_use_case.dart';
import 'package:mrjoo/features/payment/domain/use_cases/save_success_payment.dart';
import 'package:mrjoo/features/payment/domain/use_cases/send_payment_request.dart';
import 'package:mrjoo/features/payment/presentation/manager/payment_cubit.dart';

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
    sl.registerLazySingletonSafely<SaveSuccessPaymentUseCase>(
      () => SaveSuccessPaymentUseCase(sl()),
    );
    sl.registerFactorySafely<PaymentCubit>(
      () => PaymentCubit(
        sl(),
        sl(),
        sl(),
      ),
    );
  }
}
