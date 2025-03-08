import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreService {
   Future<List<QueryDocumentSnapshot>> getCollection({
    required String collectionId,
    String? orderByField,
    bool descending = false,
  }) async {
    final CollectionReference reference =
        FirebaseFirestore.instance.collection(collectionId);
    if (orderByField != null) {
      final querySnapshot = await reference
          .orderBy(
            orderByField,
            descending: descending,
          )
          .get();
      return querySnapshot.docs;
    } else {
      final querySnapshot = await reference.get();
      return querySnapshot.docs;
    }
  }

   Future<DocumentSnapshot> getDocument({
    required String collectionId,
    required String documentId,
  }) async {
    final CollectionReference reference =
        FirebaseFirestore.instance.collection(collectionId);
    final DocumentSnapshot querySnapshot =
        await reference.doc(documentId).get();
    return querySnapshot;
  }

   Future<void> updateDocument({
    required String collectionId,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    final CollectionReference reference =
        FirebaseFirestore.instance.collection(collectionId);
    await reference.doc(documentId).update(data);
  }

   Future<void> deleteDocument({
    required String collectionId,
    required String documentId,
  }) async {
    final CollectionReference reference =
        FirebaseFirestore.instance.collection(collectionId);
    await reference.doc(documentId).delete();
  }

   Future<void> addDocument({
    required String collectionId,
    required Map<String, dynamic> data,
  }) async {
    final CollectionReference reference =
        FirebaseFirestore.instance.collection(collectionId);
    await reference.add(data);
  }

   Future<void> addDocumentUsingId({
    required String collectionId,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    final CollectionReference reference =
        FirebaseFirestore.instance.collection(collectionId);
    await reference.doc(documentId).set(data);
  }
}
