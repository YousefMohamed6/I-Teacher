import 'package:iteacher/features/payment/data/models/payment/payment.dart';
import 'package:iteacher/features/payment/data/models/payment_status/payment_status.dart';
import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';
import 'package:iteacher/features/terms_and_conditions/data/models/dashboard_model.dart';

abstract class IRegisterTeacherRepo {
  Future<PaymentStatus> sendPaymentRequest({
    required PaymentModel paymentModel,
    required String token,
  });
  Future<DashboardModel> getOwnerData();
  Future<void> signUpAsTeacher({
    required String email,
    required String password,
  });
  Future<void> registerTeacher({
    required TeacherModel teacher,
  });
}
