import 'package:iteacher/features/student_data/data/model/student_model.dart';

abstract class IRegisterRepo {
  Future<void> createStudent({
    required StudentModel student,
  });
}
