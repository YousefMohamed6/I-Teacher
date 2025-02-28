import 'package:mrjoo/core/services/fatwaterak_service.dart';
import 'package:mrjoo/core/services/firebase_service.dart';
import 'package:mrjoo/core/utils/constants/firebase_keys.dart';
import 'package:mrjoo/features/payment/data/models/payment/payment.dart';
import 'package:mrjoo/features/payment/data/models/payment_methods/payment_methods.dart';
import 'package:mrjoo/features/payment/data/models/payment_status/payment_status.dart';
import 'package:mrjoo/features/payment/domain/repos/i_payment_repo.dart';

class PaymentRepoImpl implements IPaymentRepo {
  final FawaterkService fawaterkService;
  final FirebaseFirestoreService firebaseFirestoreService;
  PaymentRepoImpl(
      {required this.fawaterkService, required this.firebaseFirestoreService});

  @override
  Future<List<PaymentMethodsModel>> getPaymentMethods() async {
    final data = await fawaterkService.fetchPaymentMethods();
    List<PaymentMethodsModel> paymentMethods = [];
    for (var json in data) {
      paymentMethods.add(PaymentMethodsModel.fromJson(json));
    }
    return paymentMethods;
  }

  @override
  Future<PaymentStatus> sendPaymentRequest({
    required PaymentModel paymentModel,
  }) async {
    final body = await fawaterkService.sendPaymentRequest(
      paymentModel: paymentModel,
      paymentMethodId: paymentModel.paymentMethodId,
    );
    return PaymentStatus.fromJson(body);
  }

  @override
  Future<String> getPrice() async {
    final response = await firebaseFirestoreService.getDocument(
      collectionId: TeacherKeys.kTeacherCollection,
      documentId: TeacherKeys.kCoursePriceField,
    );
    final String price = response[TeacherKeys.kCoursePriceField];
    return price;
  }
}
