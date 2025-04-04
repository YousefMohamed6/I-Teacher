import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';
import 'package:iteacher/features/teacher_profile/domin/repos/i_teacher_profile_repo.dart';

class FetchTeacherDataUseCase {
  final ITeacherProfileRepo _repo;

  FetchTeacherDataUseCase(this._repo);

  Future<TeacherModel> execute({required String email}) async {
    return await _repo.getTeacherData(email: email);
  }
}
