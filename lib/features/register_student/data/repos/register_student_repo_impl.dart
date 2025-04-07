import 'package:iteacher/core/services/firebase_firestore_service.dart';
import 'package:iteacher/core/utils/constants/firebase_keys.dart';
import 'package:iteacher/features/register_student/domain/repos/i_register_student_repo.dart';
import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';

class RegisterStudentRepoImpl implements IRegisterStudentRepo {
  final FirebaseFirestoreService firebaseFirestoreService;
  RegisterStudentRepoImpl({required this.firebaseFirestoreService});
  @override
  Future<List<String>> getTeachersIds() async {
    final response = await firebaseFirestoreService.getCollection(
      collectionId: TeacherKeys.kTeachersCollection,
    );
    List<TeacherModel> teachers = [];
    for (var document in response) {
      var json = document.data() as Map<String, dynamic>;
      json.addAll({AccountsKeys.kAccountsCollection: []});
      teachers.add(
        TeacherModel.fromJson(json),
      );
    }
    return teachers.map((teacher) => teacher.teacherId).toList();
  }
}
