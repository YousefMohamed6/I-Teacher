import 'package:iteacher/features/payment/data/models/payment/payment.dart';
import 'package:iteacher/features/payment/data/models/payment_status/payment_status.dart';
import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';

abstract class IPaymentRepo {
  Future<PaymentStatus> sendPaymentRequest({
    required PaymentModel paymentModel,
  });
  Future<TeacherModel> getTeacherData({required String teacherId});
}
