import 'package:mrjoo/core/enums/user_role.dart';

abstract class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final UserRole userRole;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.userRole,
  });
}
