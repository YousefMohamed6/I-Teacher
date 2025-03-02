import 'package:mrjoo/features/course/domain/repos/I_course_repo.dart';
import 'package:mrjoo/features/student_data/data/model/student_model.dart';

class GetStudentDataUseCase {
  final ICourseRepo _courseRepo;
  GetStudentDataUseCase(this._courseRepo);

  Future<StudentModel> execute({required String studentEmail}) async =>
      await _courseRepo.getStudentData(studentEmail: studentEmail);
}
