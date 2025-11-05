import 'package:iteacher/core/services/fatwaterak_service.dart';
import 'package:iteacher/core/services/firebase_auth_service.dart';
import 'package:iteacher/core/services/firebase_firestore_service.dart';
import 'package:iteacher/core/utils/constants/firebase_keys.dart';
import 'package:iteacher/features/payment/data/models/payment/payment.dart';
import 'package:iteacher/features/payment/data/models/payment_status/payment_status.dart';
import 'package:iteacher/features/register_teacher/domain/repos/i_register_teacher.dart';
import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';
import 'package:iteacher/features/terms_and_conditions/data/models/dashboard_model.dart';

class RegisterTeacherRepoImpl implements IRegisterTeacherRepo {
  final FirebaseFirestoreService _firebaseFirestoreService;
  final FirebaseAuthService _firebaseAuthService;
  final FawaterkService _fawaterkService;
  RegisterTeacherRepoImpl(this._firebaseFirestoreService,
      this._firebaseAuthService, this._fawaterkService);
  @override
  Future<void> registerTeacher({required TeacherModel teacher}) {
    return _firebaseFirestoreService.addDocumentUsingId(
      collectionId: TeacherKeys.kTeachersCollection,
      documentId: teacher.email,
      data: teacher.toJson(),
    );
  }

  @override
  Future<void> signUpAsTeacher({
    required String email,
    required String password,
  }) async {
    await _firebaseAuthService.signUp(email: email, password: password);
  }

  @override
  Future<DashboardModel> getOwnerData() async {
    final response = await _firebaseFirestoreService.getDocument(
      collectionId: DashboardKeys.kDashboardCollection,
      documentId: DashboardKeys.kDashboardCollection,
    );
    final json = response.data() as Map<String, dynamic>;
    return DashboardModel.fromJson(json);
  }

  @override
  Future<PaymentStatus> sendPaymentRequest({
    required PaymentModel paymentModel,
    required String token,
  }) async {
    final json = await _fawaterkService.sendPaymentRequest(
      paymentModel: paymentModel,
      token: token,
    );
    return PaymentStatus.fromJson(json);
  }
}
