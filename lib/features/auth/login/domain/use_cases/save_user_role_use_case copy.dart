import 'package:mrjoo/features/auth/login/domain/repo/i_login_repo.dart';

class SaveUserEmailUseCase {
  final ILoginRepo _repo;

  SaveUserEmailUseCase(this._repo);
  Future<void> execute({required String email}) async {
    await _repo.saveUserEmail(email: email);
  }
}
