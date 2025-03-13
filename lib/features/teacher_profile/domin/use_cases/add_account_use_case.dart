import 'package:mrjoo/features/profile/data/model/account_model.dart';
import 'package:mrjoo/features/teacher_profile/domin/repos/i_teacher_profile_repo.dart';

class AddAccountUseCase {
  final ITeacherProfileRepo _repo;
  AddAccountUseCase(this._repo);
  Future<void> execute({
    required AccountModel account,
    required String email,
  }) async =>
      await _repo.addAccount(account: account, email: email);
}
