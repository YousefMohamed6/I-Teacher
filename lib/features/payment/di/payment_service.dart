import 'package:get_it/get_it.dart';
import 'package:mrjoo/core/extentions/getit_extension.dart';
import 'package:mrjoo/core/services/fatwaterak_service.dart';
import 'package:mrjoo/features/payment/data/repos/payment_repo_impl.dart';
import 'package:mrjoo/features/payment/domain/repos/i_payment_repo.dart';
import 'package:mrjoo/features/payment/presentation/manager/payment_cubit.dart';

class PaymentService {
  final sl = GetIt.instance;
  void initDi() {
    sl.registerLazySingletonSafely<FawaterkService>(
      () => FawaterkService(),
    );
    sl.registerLazySingletonSafely<IPaymentRepo>(
      () => PaymentRepoImpl(fawaterkService: sl()),
    );
    sl.registerLazySingletonSafely<PaymentCubit>(
      () => PaymentCubit(sl()),
    );
  }
}
