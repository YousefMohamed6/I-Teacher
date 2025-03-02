import 'package:mrjoo/features/payment/data/models/payment/payment.dart';
import 'package:mrjoo/features/payment/data/models/payment_status/payment_status.dart';
import 'package:mrjoo/features/student_data/data/model/teacher_model.dart';

abstract class IPaymentRepo {
  Future<PaymentStatus> sendPaymentRequest({
    required PaymentModel paymentModel,
  });
  Future<TeacherModel> getTeacherData({required String teacherId});
}
