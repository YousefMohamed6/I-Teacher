import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iteacher/core/services/firebase_firestore_service.dart';
import 'package:iteacher/core/utils/constants/firebase_keys.dart';

class ListenToMessagesUseCase {
  final FirebaseFirestoreService _firebaseFirestoreService;

  ListenToMessagesUseCase(this._firebaseFirestoreService);
  void execute({
    required Function(List<QueryDocumentSnapshot>) onChange,
  }) {
    _firebaseFirestoreService.listenToCollection(
      onChange: onChange,
      collectionId: ChatKeys.kChatCollection,
      orderByField: ChatKeys.kCreatedAtField,
      descending: true,
    );
  }
}
