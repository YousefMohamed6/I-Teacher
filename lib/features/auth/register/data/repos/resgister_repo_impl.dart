import 'package:iteacher/core/services/firebase_firestore_service.dart';
import 'package:iteacher/core/utils/constants/firebase_keys.dart';
import 'package:iteacher/features/auth/register/domain/repos/i_register_repo.dart';
import 'package:iteacher/features/student_data/data/model/student_model.dart';

class RegisterRepoImpl implements IRegisterRepo {
  final FirebaseFirestoreService _firebaseFirestoreService;

  RegisterRepoImpl(this._firebaseFirestoreService);

  @override
  Future<void> createStudent({required StudentModel student}) async {
    await _firebaseFirestoreService.addDocumentUsingId(
      collectionId: StudentKeys.kStudentsCollection,
      data: student.toJson(),
      documentId: student.email,
    );
  }
}
