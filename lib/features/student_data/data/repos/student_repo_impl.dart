import 'package:mrjoo/core/services/firebase_service.dart';
import 'package:mrjoo/core/utils/constants/firebase_keys.dart';
import 'package:mrjoo/features/student_data/data/model/teacher_model.dart';
import 'package:mrjoo/features/student_data/domain/repos/i_student_repo.dart';

class StudentRepoImpl implements IStudentRepo {
  final FirebaseFirestoreService firebaseFirestoreService;
  StudentRepoImpl({required this.firebaseFirestoreService});
  @override
  Future<List<String>> getTeachersIds() async {
    final response = await firebaseFirestoreService.getCollection(
      collectionId: TeacherKeys.kTeachersCollection,
    );
    List<TeacherModel> teachers = [];
    for (var document in response) {
      teachers.add(
        TeacherModel.fromJson(document.data() as Map<String, dynamic>),
      );
    }
    return teachers.map((teacher) => teacher.teacherId).toList();
  }
}
