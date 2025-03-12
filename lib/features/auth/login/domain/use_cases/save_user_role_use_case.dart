import 'package:mrjoo/core/enums/user_role.dart';
import 'package:mrjoo/features/auth/login/domain/repo/i_login_repo.dart';

class SaveUserRoleUseCase {
  final ILoginRepo _repo;

  SaveUserRoleUseCase(this._repo);
  Future<void> execute({required UserRole userRole}) async {
    await _repo.saveUserRole(userRole: userRole);
  }
}
