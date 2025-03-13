import 'package:mrjoo/features/profile/data/model/account_model.dart';
import 'package:mrjoo/features/teacher_profile/domin/repos/i_teacher_profile_repo.dart';

class DeleteAccountUseCase {
  final ITeacherProfileRepo _repo;
  DeleteAccountUseCase(this._repo);
  Future<void> execute({
    required AccountModel account,
    required String email,
  }) async =>
      await _repo.deleteAccount(account: account, email: email);
}
