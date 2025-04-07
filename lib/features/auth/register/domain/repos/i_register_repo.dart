import 'package:iteacher/features/register_student/data/model/student_model.dart';

abstract class IRegisterRepo {
  Future<void> createStudent({
    required StudentModel student,
  });
}
