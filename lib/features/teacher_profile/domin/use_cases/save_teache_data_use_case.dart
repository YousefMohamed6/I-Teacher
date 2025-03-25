import 'package:firebase_auth/firebase_auth.dart';
import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';
import 'package:iteacher/features/teacher_profile/domin/repos/i_teacher_profile_repo.dart';

class SaveTeacherDataUseCase {
  final ITeacherProfileRepo _repo;

  SaveTeacherDataUseCase(this._repo);
  Future<void> execute({required TeacherModel teacherModel}) async {
    await FirebaseAuth.instance.currentUser?.updateDisplayName(
        "${teacherModel.firstName} ${teacherModel.lastName}");
    await _repo.saveTeacherData(teacherModel: teacherModel);
  }
}
