import 'package:iteacher/features/register_teacher/domain/repos/i_register_teacher.dart';
import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';

class CreateTeacherUseCase {
  final IRegisterTeacherRepo _registerTeacherRepoImpl;
  CreateTeacherUseCase(this._registerTeacherRepoImpl);

  Future<void> execute({
    required TeacherModel teacher,
    required String password,
  }) async {
    await _registerTeacherRepoImpl.signUpAsTeacher(
      email: teacher.email,
      password: password,
    );
    await _registerTeacherRepoImpl.registerTeacher(teacher: teacher);
  }
}
