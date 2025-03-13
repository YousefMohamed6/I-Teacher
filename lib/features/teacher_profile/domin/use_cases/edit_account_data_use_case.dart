import 'package:mrjoo/features/profile/data/model/account_model.dart';
import 'package:mrjoo/features/teacher_profile/domin/repos/i_teacher_profile_repo.dart';

class EditAccountUseCase {
  final ITeacherProfileRepo _repo;
  EditAccountUseCase(this._repo);
  Future<void> execute({
    required AccountModel account,
    required String email,
  }) async =>
      await _repo.editAccount(account: account, email: email);
}
