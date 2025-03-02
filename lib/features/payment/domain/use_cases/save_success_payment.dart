import 'package:mrjoo/core/services/firebase_service.dart';
import 'package:mrjoo/core/utils/constants/firebase_keys.dart';
import 'package:mrjoo/features/payment/data/models/data_base_payments.dart';

class SaveSuccessPaymentUseCase {
  final FirebaseFirestoreService firebaseFirestoreService;
  SaveSuccessPaymentUseCase(this.firebaseFirestoreService);

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
