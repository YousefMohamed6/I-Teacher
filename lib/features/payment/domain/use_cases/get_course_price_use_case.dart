import 'package:mrjoo/features/payment/domain/repos/i_payment_repo.dart';

class GetCoursePriceUseCase {
  final IPaymentRepo paymentRepo;

  GetCoursePriceUseCase(this.paymentRepo);
  Future<String> execute() async {
    return await paymentRepo.getPrice();
  }
}
