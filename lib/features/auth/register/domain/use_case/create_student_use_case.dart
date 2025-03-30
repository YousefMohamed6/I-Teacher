import 'package:iteacher/features/auth/register/domain/repos/i_register_repo.dart';
import 'package:iteacher/features/student_data/data/model/student_model.dart';

class CreateStudentUseCase {
  final IRegisterRepo registerRepo;

  CreateStudentUseCase(this.registerRepo);
  Future<void> execute({required StudentModel student}) async {
    await registerRepo.createStudent(student: student);
  }
}
