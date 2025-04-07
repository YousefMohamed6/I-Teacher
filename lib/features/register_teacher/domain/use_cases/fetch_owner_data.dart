import 'package:iteacher/features/register_teacher/domain/repos/i_register_teacher.dart';
import 'package:iteacher/features/terms_and_conditions/data/models/dashboard_model.dart';

class FetchOwnerDataUseCase {
  final IRegisterTeacherRepo _registerTeacherRepo;
  FetchOwnerDataUseCase(this._registerTeacherRepo);

  Future<DashboardModel> execute() async {
    return await _registerTeacherRepo.getOwnerData();
  }
}
