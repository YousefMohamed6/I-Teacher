import 'package:mrjoo/features/profile/data/model/account_model.dart';
import 'package:mrjoo/features/profile/data/model/teacher_model.dart';

abstract class ITeacherProfileRepo {
  Future<TeacherModel> getTeacherData({required String email});
  Future<void> saveTeacherData({required TeacherModel teacherModel});
  Future<String> pickTeacherImage();
  Future<void> addAccount({
    required AccountModel account,
    required String email,
  });
  Future<void> editAccount({
    required AccountModel account,
    required String email,
  });
  Future<void> deleteAccount({
    required AccountModel account,
    required String email,
  });
}
