import 'package:mrjoo/features/payment/data/models/payment/payment.dart';
import 'package:mrjoo/features/payment/data/models/payment_status/payment_status.dart';
import 'package:mrjoo/features/payment/domain/repos/i_payment_repo.dart';

class SendPaymentRequestUseCase {
  final IPaymentRepo paymentRepo;

  SendPaymentRequestUseCase(this.paymentRepo);

  Future<PaymentStatus> execute({
    required PaymentModel paymentModel,
  }) async {
    return await paymentRepo.sendPaymentRequest(
      paymentModel: paymentModel,
    );
  }
}
