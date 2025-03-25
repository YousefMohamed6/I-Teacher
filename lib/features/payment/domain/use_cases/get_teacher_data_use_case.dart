import 'package:iteacher/features/payment/domain/repos/i_payment_repo.dart';
import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';

class GetTeacherDataUseCase {
  final IPaymentRepo _paymentRepo;

  GetTeacherDataUseCase(this._paymentRepo);
  Future<TeacherModel> execute({required String teacherId}) async {
    return await _paymentRepo.getTeacherData(teacherId: teacherId);
  }
}
