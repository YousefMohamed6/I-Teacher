import 'package:iteacher/features/student_data/domain/repos/i_student_repo.dart';

class GetTeachersIdsUseCase {
  final IStudentRepo studentRepo;

  GetTeachersIdsUseCase(this.studentRepo);
  Future<List<String>> execute() async {
    return await studentRepo.getTeachersIds();
  }
}
