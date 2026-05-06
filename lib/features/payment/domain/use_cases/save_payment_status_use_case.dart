import 'package:iteacher/core/services/firebase_firestore_service.dart';
import 'package:iteacher/core/utils/constants/firebase_keys.dart';
import 'package:iteacher/features/payment/data/models/payment_operation_model.dart';

class SavePaymentStatusUseCase {
  final FirebaseFirestoreService firebaseFirestoreService;
  SavePaymentStatusUseCase(this.firebaseFirestoreService);

  Future<void> execute({
    required PaymentOprationModel paymentOprationModel,
  }) async {
    await firebaseFirestoreService.addDocumentUsingId(
      collectionId: PaymentsKeys.kPaymentsCollection,
      documentId: paymentOprationModel.invoiceId,
      data: paymentOprationModel.toJson(),
    );
  }
}
