import 'package:mrjoo/features/payment/domain/repos/i_payment_repo.dart';
import 'package:mrjoo/features/student_data/data/model/teacher_model.dart';

class GetTeacherDataUseCase {
  final IPaymentRepo paymentRepo;

  GetTeacherDataUseCase(this.paymentRepo);
  Future<TeacherModel> execute({required String teacherId}) async {
    return await paymentRepo.getTeacherData(teacherId: teacherId);
  }
}
