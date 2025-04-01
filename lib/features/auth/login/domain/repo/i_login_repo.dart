import 'package:iteacher/core/enums/user_role.dart';
import 'package:iteacher/core/models/user_model.dart';

abstract class ILoginRepo {
  Future<UserModel> getUserData({
    required bool isStudent,
    required String email,
  });
  Future<void> saveUserRole({required UserRole userRole});
  Future<void> saveUserEmail({required String email});
}
