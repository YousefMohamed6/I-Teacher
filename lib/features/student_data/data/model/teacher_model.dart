import 'package:mrjoo/core/utils/constants/firebase_keys.dart';

class TeacherModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String department;
  final String description;

  final String coursePrice;
  final String courseLink;
  final String teacherId;

  TeacherModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.department,
    required this.coursePrice,
    required this.description,
    required this.courseLink,
    required this.teacherId,
  });
  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      firstName: json[TeacherKeys.kfirstNameField],
      lastName: json[TeacherKeys.kLastNameField],
      email: json[TeacherKeys.kEmailField],
      phone: json[TeacherKeys.kPhoneField],
      department: json[TeacherKeys.kDepartmentField],
      description: json[TeacherKeys.kDescriptionField],
      coursePrice: json[TeacherKeys.kCoursePriceField],
      courseLink: json[TeacherKeys.kCourseLinkField],
      teacherId: json[TeacherKeys.kTeacherIdField],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      TeacherKeys.kfirstNameField: firstName,
      TeacherKeys.kLastNameField: lastName,
      TeacherKeys.kEmailField: email,
      TeacherKeys.kPhoneField: phone,
      TeacherKeys.kDepartmentField: department,
      TeacherKeys.kDescriptionField: description,
      TeacherKeys.kCoursePriceField: coursePrice,
      TeacherKeys.kCourseLinkField: courseLink,
      TeacherKeys.kTeacherIdField: teacherId,
    };
  }
}
