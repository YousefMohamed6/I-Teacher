import 'package:mrjoo/core/models/user_model.dart';
import 'package:mrjoo/features/auth/login/domain/repo/i_login_repo.dart';

class GetUserDataUseCase {
  final ILoginRepo _repo;

  GetUserDataUseCase(this._repo);
  Future<UserModel> execute({
    required bool isStudent,
    required String email,
  }) async {
    return await _repo.getUserData(isStudent: isStudent, email: email);
  }
}
