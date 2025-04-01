import 'package:iteacher/features/course/domain/repos/i_course_repo.dart';
import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';

class GetTeacherDataUseCase {
  final ICourseRepo _courseRepo;
  GetTeacherDataUseCase(this._courseRepo);

  Future<TeacherModel> execute({required String teacherId}) async =>
      await _courseRepo.getTeacherData(teacherId: teacherId);
}
