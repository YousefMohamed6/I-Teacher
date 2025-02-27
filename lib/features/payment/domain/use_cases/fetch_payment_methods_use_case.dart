import 'package:mrjoo/features/payment/data/models/payment_methods/payment_methods.dart';
import 'package:mrjoo/features/payment/domain/repos/i_payment_repo.dart';

class FetchPaymentMethodsUseCase {
  final IPaymentRepo paymentRepo;
  FetchPaymentMethodsUseCase(this.paymentRepo);
  Future<List<PaymentMethodsModel>> execute() async {
    return await paymentRepo.getPaymentMethods();
  }
}
