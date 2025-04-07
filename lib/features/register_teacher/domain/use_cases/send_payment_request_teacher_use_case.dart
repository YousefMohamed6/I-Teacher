import 'package:iteacher/features/payment/data/models/payment/payment.dart';
import 'package:iteacher/features/payment/data/models/payment_status/payment_status.dart';
import 'package:iteacher/features/register_teacher/domain/repos/i_register_teacher.dart';

class SendPaymentRequestTeacherUseCase {
  final IRegisterTeacherRepo registerTeacherRepo;
  SendPaymentRequestTeacherUseCase(this.registerTeacherRepo);
  Future<PaymentStatus> execute({
    required PaymentModel paymentModel,
    required String token,
  }) async {
    return await registerTeacherRepo.sendPaymentRequest(
      paymentModel: paymentModel,
      token: token,
    );
  }
}
