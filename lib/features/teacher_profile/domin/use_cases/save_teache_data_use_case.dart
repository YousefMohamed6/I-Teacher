import 'package:mrjoo/features/profile/data/model/teacher_model.dart';
import 'package:mrjoo/features/teacher_profile/domin/repos/i_teacher_profile_repo.dart';

class SaveTeacherDataUseCase {
  final ITeacherProfileRepo _repo;

  SaveTeacherDataUseCase(this._repo);
  Future<void> execute({required TeacherModel teacherModel}) async {
    await _repo.saveTeacherData(teacherModel: teacherModel);
  }
}
