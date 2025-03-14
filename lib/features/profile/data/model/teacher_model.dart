import 'package:mrjoo/core/enums/user_role.dart';
import 'package:mrjoo/core/models/user_model.dart';
import 'package:mrjoo/core/utils/constants/firebase_keys.dart';
import 'package:mrjoo/features/profile/data/model/account_model.dart';

class TeacherModel implements UserModel {
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String phone;
  @override
  final UserRole userRole = UserRole.teacher;
  final String department;
  final String description;
  final String coursePrice;
  final String courseLink;
  final String teacherId;
  @override
  String imageBase64;
  List<AccountModel> accounts;

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
    required this.accounts,
    required this.imageBase64,
  });
  @override
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
      imageBase64: json[TeacherKeys.kTeacherImageField],
      accounts: (json[AccountsKeys.kAccountsCollection] as List<dynamic>)
          .map((account) =>
              AccountModel.fromJson(account.data() as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
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
      TeacherKeys.kTeacherImageField: imageBase64,
      TeacherKeys.kTeacherIdField: teacherId,
    };
  }
}
