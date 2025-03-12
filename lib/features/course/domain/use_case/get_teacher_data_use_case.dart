import 'package:mrjoo/features/course/domain/repos/I_course_repo.dart';
import 'package:mrjoo/features/profile/data/model/teacher_model.dart';

class GetTeacherDataUseCase {
  final ICourseRepo _courseRepo;
  GetTeacherDataUseCase(this._courseRepo);

  Future<TeacherModel> execute({required String teacherId}) async =>
      await _courseRepo.getTeacherData(teacherId: teacherId);
}
