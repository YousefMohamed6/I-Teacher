import 'package:iteacher/core/enums/user_role.dart';
import 'package:iteacher/core/models/user_model.dart';
import 'package:iteacher/core/utils/constants/firebase_keys.dart';
import 'package:iteacher/features/payment/data/models/payment/customer_model.dart';
import 'package:iteacher/features/teacher_profile/data/model/account_model.dart';

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
  final String address;
  @override
  final UserRole userRole = UserRole.teacher;
  final String department;
  final String description;
  final String coursePrice;
  final String channelId;
  final String teacherId;
  final String paymentId;
  final bool supportsSignLanguage;
  @override
  String imageBase64;
  Set<AccountModel> accounts;

  TeacherModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.address,
    required this.department,
    required this.coursePrice,
    required this.description,
    required this.channelId,
    required this.teacherId,
    required this.paymentId,
    required this.accounts,
    required this.imageBase64,
    required this.supportsSignLanguage,
  });
  @override
  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      firstName: json[TeacherKeys.kfirstNameField],
      lastName: json[TeacherKeys.kLastNameField],
      email: json[TeacherKeys.kEmailField],
      phone: json[TeacherKeys.kPhoneField],
      address: json[TeacherKeys.kAddressField],
      department: json[TeacherKeys.kDepartmentField],
      description: json[TeacherKeys.kDescriptionField],
      coursePrice: json[TeacherKeys.kCoursePriceField],
      channelId: json[TeacherKeys.kChannelIdField],
      teacherId: json[TeacherKeys.kTeacherIdField],
      paymentId: json[TeacherKeys.kPaymentIdField],
      imageBase64: json[TeacherKeys.kTeacherImageField],
      supportsSignLanguage:
          json[TeacherKeys.kSupportsSignLanguageField] ?? false,
      accounts: (json[AccountsKeys.kAccountsCollection] as List<dynamic>)
          .map((account) =>
              AccountModel.fromJson(account.data() as Map<String, dynamic>))
          .toSet(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      TeacherKeys.kfirstNameField: firstName,
      TeacherKeys.kLastNameField: lastName,
      TeacherKeys.kEmailField: email,
      TeacherKeys.kPhoneField: phone,
      TeacherKeys.kAddressField: address,
      TeacherKeys.kDepartmentField: department,
      TeacherKeys.kDescriptionField: description,
      TeacherKeys.kCoursePriceField: coursePrice,
      TeacherKeys.kChannelIdField: channelId,
      TeacherKeys.kTeacherImageField: imageBase64,
      TeacherKeys.kTeacherIdField: teacherId,
      TeacherKeys.kPaymentIdField: paymentId,
      TeacherKeys.kSupportsSignLanguageField: supportsSignLanguage,
    };
  }

  CustomerModel toCustomer() => CustomerModel(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        address: address,
      );
}
