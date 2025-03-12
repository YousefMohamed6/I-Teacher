import 'package:mrjoo/features/profile/data/model/teacher_model.dart';

abstract class ITeacherProfileRepo {
  Future<TeacherModel> getTeacherData({required String email});
  Future<void> saveTeacherData({required TeacherModel teacherModel});
  Future<String> pickTeacherImage();
}
