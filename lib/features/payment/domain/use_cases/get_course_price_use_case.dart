import 'package:mrjoo/features/payment/domain/repos/i_payment_repo.dart';
import 'package:mrjoo/features/student_data/data/model/teacher_model.dart';

class GetTeacherDataUseCase {
  final IPaymentRepo _paymentRepo;

  GetTeacherDataUseCase(this._paymentRepo);
  Future<TeacherModel> execute({required String teacherId}) async {
    return await _paymentRepo.getTeacherData(teacherId: teacherId);
  }
}
