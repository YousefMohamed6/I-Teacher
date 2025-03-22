import 'package:iteacher/core/services/firebase_firestore_service.dart';
import 'package:iteacher/core/utils/constants/firebase_keys.dart';
import 'package:iteacher/features/payment/data/models/data_base_payments.dart';

class SavePaymentStatusUseCase {
  final FirebaseFirestoreService firebaseFirestoreService;
  SavePaymentStatusUseCase(this.firebaseFirestoreService);

  Future<void> execute({
    required DatabasePaymentModel databasePaymentModel,
  }) async {
    await firebaseFirestoreService.addDocumentUsingId(
      collectionId: PaymentsKeys.kPaymentsCollection,
      documentId: databasePaymentModel.invoiceId,
      data: databasePaymentModel.toJson(),
    );
  }
}
