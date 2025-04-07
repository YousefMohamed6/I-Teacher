import 'package:iteacher/features/register_student/domain/repos/i_register_student_repo.dart';

class GetTeachersIdsUseCase {
  final IRegisterStudentRepo studentRepo;

  GetTeachersIdsUseCase(this.studentRepo);
  Future<List<String>> execute() async {
    return await studentRepo.getTeachersIds();
  }
}
