import 'package:mrjoo/core/utils/constants/firebase_keys.dart';
import 'package:mrjoo/features/payment/data/models/payment/customer_model.dart';

class StudentModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String address;
  final String expiryDate;
  final String subscriptionDate;
  final String teacherId;

  StudentModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.address,
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
      expiryDate: json[StudentKeys.kExpiryDate],
      subscriptionDate: json[StudentKeys.kSubscriptionDate],
      teacherId: json[StudentKeys.kTeacherIdField],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      StudentKeys.kfirstNameField: firstName,
      StudentKeys.kLastNameField: lastName,
      StudentKeys.kEmailField: email,
      StudentKeys.kPhoneField: phone,
      StudentKeys.kStudentAddress: address,
      StudentKeys.kExpiryDate: expiryDate,
      StudentKeys.kSubscriptionDate: expiryDate,
      StudentKeys.kTeacherIdField: teacherId,
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
