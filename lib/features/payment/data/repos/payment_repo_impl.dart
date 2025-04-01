import 'package:iteacher/core/services/fatwaterak_service.dart';
import 'package:iteacher/core/services/firebase_firestore_service.dart';
import 'package:iteacher/core/utils/constants/firebase_keys.dart';
import 'package:iteacher/features/payment/data/models/payment/payment.dart';
import 'package:iteacher/features/payment/data/models/payment_status/payment_status.dart';
import 'package:iteacher/features/payment/domain/repos/i_payment_repo.dart';
import 'package:iteacher/features/profile/data/model/account_model.dart';
import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';

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
    final response = await firebaseFirestoreService.getCollection(
      collectionId: TeacherKeys.kTeachersCollection,
    );
    List<TeacherModel> teachers = response.map((e) {
      var json = e.data() as Map<String, dynamic>;
      json.addAll({AccountsKeys.kAccountsCollection: []});
      return TeacherModel.fromJson(json);
    }).toList();
    final teacher =
        teachers.firstWhere((element) => element.teacherId == teacherId);
    final accounts = await firebaseFirestoreService.getSubCollection(
      collectionId: TeacherKeys.kTeachersCollection,
      documentId: teacher.email,
      subCollectionId: AccountsKeys.kAccountsCollection,
    );
    Set<AccountModel> accountsList = accounts
        .map((account) =>
            AccountModel.fromJson(account.data() as Map<String, dynamic>))
        .toSet();
    teacher.accounts = accountsList;
    return teacher;
  }
}
