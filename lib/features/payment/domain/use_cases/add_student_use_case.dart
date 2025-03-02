import 'package:mrjoo/core/services/firebase_service.dart';
import 'package:mrjoo/core/utils/constants/firebase_keys.dart';
import 'package:mrjoo/features/student_data/data/model/student_model.dart';

class AddStudentUseCase {
  final FirebaseFirestoreService _firebaseFirestoreService;
  AddStudentUseCase(this._firebaseFirestoreService);

  Future<void> execute({required StudentModel student}) async {
    await _firebaseFirestoreService.addDocumentUsingId(
      collectionId: StudentKeys.kStudentsCollection,
      documentId: student.email,
      data: student.toJson(),
    );
  }
}
