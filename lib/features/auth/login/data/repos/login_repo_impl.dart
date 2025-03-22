import 'package:iteacher/core/enums/user_role.dart';
import 'package:iteacher/core/exceptions/unfound_user.dart';
import 'package:iteacher/core/models/user_model.dart';
import 'package:iteacher/core/services/firebase_firestore_service.dart';
import 'package:iteacher/core/services/sf_service.dart';
import 'package:iteacher/core/utils/constants/firebase_keys.dart';
import 'package:iteacher/core/utils/constants/sf_keys.dart';
import 'package:iteacher/features/auth/login/domain/repo/i_login_repo.dart';
import 'package:iteacher/features/profile/data/model/teacher_model.dart';
import 'package:iteacher/features/student_data/data/model/student_model.dart';

class LoginRepoImpl implements ILoginRepo {
  final FirebaseFirestoreService firebaseFirestoreService;

  LoginRepoImpl({required this.firebaseFirestoreService});
  Future<TeacherModel> _getTeacherData({required String email}) async {
    final response = await firebaseFirestoreService.getCollection(
      collectionId: TeacherKeys.kTeachersCollection,
    );
    for (var json in response) {
      Map<String, dynamic> data = json.data() as Map<String, dynamic>;
      data.addAll({AccountsKeys.kAccountsCollection: []});
      final teacher = TeacherModel.fromJson(data);
      if (teacher.email == email.trim()) return teacher;
    }
    throw UnFoundUser();
  }

  Future<StudentModel> _getStudent({required String email}) async {
    final response = await firebaseFirestoreService.getCollection(
      collectionId: StudentKeys.kStudentsCollection,
    );
    for (var json in response) {
      final student =
          StudentModel.fromJson(json.data() as Map<String, dynamic>);
      if (student.email == email.trim()) return student;
    }
    throw UnFoundUser();
  }

  @override
  Future<UserModel> getUserData(
      {required bool isStudent, required String email}) async {
    if (isStudent) {
      return await _getStudent(email: email);
    }
    return _getTeacherData(email: email);
  }

  @override
  Future<void> saveUserRole({required UserRole userRole}) async {
    await SharedPreferencesService.saveString(SfKeys.userRole, userRole.name);
  }

  @override
  Future<void> saveUserEmail({required String email}) async {
    await SharedPreferencesService.saveString(SfKeys.userEmail, email);
  }
}
