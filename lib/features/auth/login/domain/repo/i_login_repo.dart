import 'package:mrjoo/core/enums/user_role.dart';
import 'package:mrjoo/core/models/user_model.dart';

abstract class ILoginRepo {
  Future<UserModel> getUserData({
    required bool isStudent,
    required String email,
  });
  Future<void> saveUserRole({required UserRole userRole});
  Future<void> saveUserEmail({required String email});
}
