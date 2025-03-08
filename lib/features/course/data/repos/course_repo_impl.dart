import 'package:mrjoo/core/services/firebase_firestore_service.dart';
import 'package:mrjoo/core/utils/constants/firebase_keys.dart';
import 'package:mrjoo/features/course/domain/repos/I_course_repo.dart';
import 'package:mrjoo/features/student_data/data/model/student_model.dart';
import 'package:mrjoo/features/student_data/data/model/teacher_model.dart';

class CourseRepoImpl implements ICourseRepo {
  final FirebaseFirestoreService firebaseFirestoreService;

  CourseRepoImpl({required this.firebaseFirestoreService});

  @override
  Future<StudentModel> getStudentData({required String studentEmail}) async {
    final response = await firebaseFirestoreService.getDocument(
      collectionId: StudentKeys.kStudentsCollection,
      documentId: studentEmail,
    );
    return StudentModel.fromJson(response.data() as Map<String, dynamic>);
  }

  @override
  Future<TeacherModel> getTeacherData({required String teacherId}) async {
    final response = await firebaseFirestoreService.getDocument(
      collectionId: TeacherKeys.kTeachersCollection,
      documentId: teacherId,
    );
    return TeacherModel.fromJson(response.data() as Map<String, dynamic>);
  }
}
