import 'package:iteacher/features/teacher_profile/domin/repos/i_teacher_profile_repo.dart';

class PickTeacherImageUseCase {
  final ITeacherProfileRepo _repo;
  PickTeacherImageUseCase(this._repo);

  Future<String> execute() async => await _repo.pickTeacherImage();
}
