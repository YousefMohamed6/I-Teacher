import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iteacher/core/enums/user_role.dart';
import 'package:iteacher/core/models/user_model.dart';
import 'package:iteacher/core/utils/constants/firebase_keys.dart';
import 'package:iteacher/features/payment/data/models/payment/customer_model.dart';

class StudentModel implements UserModel {
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String imageBase64;
  @override
  final UserRole userRole = UserRole.student;
  final String address;
  final DateTime expiryDate;
  final DateTime subscriptionDate;
  final String teacherId;

  StudentModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.address,
    required this.imageBase64,
    required this.expiryDate,
    required this.subscriptionDate,
    required this.teacherId,
  });
  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      firstName: json[StudentKeys.kfirstNameField],
      lastName: json[StudentKeys.kLastNameField],
      email: json[StudentKeys.kEmailField],
      phone: json[StudentKeys.kPhoneField],
      address: json[StudentKeys.kStudentAddress],
      expiryDate: (json[StudentKeys.kExpiryDate] as Timestamp).toDate(),
      subscriptionDate:
          (json[StudentKeys.kSubscriptionDate] as Timestamp).toDate(),
      teacherId: json[StudentKeys.kTeacherIdField],
      imageBase64: json[StudentKeys.kStudentImageField],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      StudentKeys.kfirstNameField: firstName,
      StudentKeys.kLastNameField: lastName,
      StudentKeys.kEmailField: email,
      StudentKeys.kPhoneField: phone,
      StudentKeys.kStudentAddress: address,
      StudentKeys.kStudentImageField: imageBase64,
      StudentKeys.kExpiryDate: expiryDate,
      StudentKeys.kSubscriptionDate: subscriptionDate,
      StudentKeys.kTeacherIdField: teacherId,
      StudentKeys.kStudentRoleField: userRole.name,
    };
  }

  CustomerModel toCustomer() {
    return CustomerModel(
      firstName: firstName,
      lastName: lastName,
      address: address,
      email: email,
      phone: phone,
    );
  }
}
