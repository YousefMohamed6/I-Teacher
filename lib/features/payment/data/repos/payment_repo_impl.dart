import 'package:mrjoo/core/services/fatwaterak_service.dart';
import 'package:mrjoo/core/services/firebase_service.dart';
import 'package:mrjoo/core/utils/constants/firebase_keys.dart';
import 'package:mrjoo/features/payment/data/models/payment/payment.dart';
import 'package:mrjoo/features/payment/data/models/payment_status/payment_status.dart';
import 'package:mrjoo/features/payment/domain/repos/i_payment_repo.dart';
import 'package:mrjoo/features/student_data/data/model/teacher_model.dart';

class PaymentRepoImpl implements IPaymentRepo {
  final FawaterkService fawaterkService;
  final FirebaseFirestoreService firebaseFirestoreService;
  PaymentRepoImpl(
      {required this.fawaterkService, required this.firebaseFirestoreService});

  @override
  Future<PaymentStatus> sendPaymentRequest({
    required PaymentModel paymentModel,
  }) async {
    final body = await fawaterkService.sendPaymentRequest(
      paymentModel: paymentModel,
    );
    return PaymentStatus.fromJson(
      body,
    );
  }

  @override
  Future<TeacherModel> getTeacherData({required String teacherId}) async {
    final response = await firebaseFirestoreService.getDocument(
      collectionId: TeacherKeys.kTeachersCollection,
      documentId: teacherId,
    );
    return TeacherModel.fromJson(response.data() as Map<String, dynamic>);
  }
}
