import 'package:iteacher/features/course/domain/repos/i_course_repo.dart';
import 'package:iteacher/features/student_data/data/model/student_model.dart';

class GetStudentDataUseCase {
  final ICourseRepo _courseRepo;
  GetStudentDataUseCase(this._courseRepo);

  Future<StudentModel> execute({required String studentEmail}) async =>
      await _courseRepo.getStudentData(studentEmail: studentEmail);
}
