import 'package:iteacher/core/enums/user_role.dart';
import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';
import 'package:iteacher/features/student_data/data/model/student_model.dart';

abstract class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String imageBase64;
  final UserRole userRole;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.userRole,
    required this.imageBase64,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    switch (json['userRole']) {
      case 'student':
        return StudentModel.fromJson(json);
      case 'teacher':
        return TeacherModel.fromJson(json);
      default:
        throw Exception('Invalid user role');
    }
  }

  Map<String, dynamic> toJson();
}
