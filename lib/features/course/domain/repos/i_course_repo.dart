import 'package:mrjoo/features/student_data/data/model/student_model.dart';
import 'package:mrjoo/features/profile/data/model/teacher_model.dart';

abstract class ICourseRepo {
  Future<StudentModel> getStudentData({required String studentEmail});
  Future<TeacherModel> getTeacherData({required String teacherId});
}
