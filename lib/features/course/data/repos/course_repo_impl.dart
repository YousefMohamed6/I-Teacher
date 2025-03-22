import 'package:iteacher/core/services/firebase_firestore_service.dart';
import 'package:iteacher/core/utils/constants/firebase_keys.dart';
import 'package:iteacher/features/course/domain/repos/I_course_repo.dart';
import 'package:iteacher/features/profile/data/model/account_model.dart';
import 'package:iteacher/features/profile/data/model/teacher_model.dart';
import 'package:iteacher/features/student_data/data/model/student_model.dart';

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
    final response = await firebaseFirestoreService.getCollection(
      collectionId: TeacherKeys.kTeachersCollection,
    );
    List<TeacherModel> teachers = response.map((e) {
      var json = e.data() as Map<String, dynamic>;
      json.addAll({AccountsKeys.kAccountsCollection: []});
      return TeacherModel.fromJson(json);
    }).toList();
    final teacher =
        teachers.firstWhere((element) => element.teacherId == teacherId);
    final accounts = await firebaseFirestoreService.getSubCollection(
      collectionId: TeacherKeys.kTeachersCollection,
      documentId: teacher.email,
      subCollectionId: AccountsKeys.kAccountsCollection,
    );
    Set<AccountModel> accountsList = accounts
        .map((account) =>
            AccountModel.fromJson(account.data() as Map<String, dynamic>))
        .toSet();
    teacher.accounts = accountsList;
    return teacher;
  }
}
