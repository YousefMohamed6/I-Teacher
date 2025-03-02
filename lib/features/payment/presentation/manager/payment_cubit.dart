import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mrjoo/features/payment/data/models/data_base_payments.dart';
import 'package:mrjoo/features/payment/data/models/payment/cart_item.dart';
import 'package:mrjoo/features/payment/data/models/payment/payment.dart';
import 'package:mrjoo/features/payment/data/models/payment/redirection_urls.dart';
import 'package:mrjoo/features/payment/data/models/payment_status/payment_status.dart';
import 'package:mrjoo/features/payment/domain/use_cases/add_student_use_case.dart';
import 'package:mrjoo/features/payment/domain/use_cases/get_course_price_use_case.dart';
import 'package:mrjoo/features/payment/domain/use_cases/save_success_payment.dart';
import 'package:mrjoo/features/payment/domain/use_cases/send_payment_request.dart';
import 'package:mrjoo/features/student_data/data/model/student_model.dart';
import 'package:mrjoo/features/student_data/data/model/teacher_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'payment_cubit.freezed.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final SendPaymentRequestUseCase _sendPaymentRequestUseCase;
  final GetTeacherDataUseCase _getTeacherDataUseCase;
  final SaveSuccessPaymentUseCase _saveSuccessPaymentUseCase;
  final AddStudentUseCase _addStudentUseCase;
  PaymentCubit(
    this._sendPaymentRequestUseCase,
    this._getTeacherDataUseCase,
    this._saveSuccessPaymentUseCase,
    this._addStudentUseCase,
  ) : super(PaymentState.initial());
  int selectIndex = 0;
  late StudentModel studentModel;
  late TeacherModel teacherModel;
  void initState(StudentModel student) {
    studentModel = student;
  }

  void selectPaymentMethod(int index) {
    emit(PaymentState.initial());
    selectIndex = index;
    emit(PaymentState<int>.success(index));
  }

  Future<PaymentStatus> createPayment({required String courePrice}) async {
    final PaymentStatus paymentStatus =
        await _sendPaymentRequestUseCase.execute(
      paymentModel: PaymentModel(
        cartTotal: courePrice,
        currency: "EGP",
        cartItems: [
          CartItem(
            name: "Online Course",
            price: courePrice,
            quantity: "1",
          ),
        ],
        customer: studentModel.toCustomer(),
        redirectionUrls: RedirectionUrls.fromJson(
          {
            "successUrl": "https://dev.fawaterk.com/success",
            "failUrl": "https://dev.fawaterk.com/fail",
            "pendingUrl": "https://dev.fawaterk.com/pending"
          },
        ),
      ),
    );
    emit(PaymentState<PaymentStatus>.success(paymentStatus));
    return paymentStatus;
  }

  Future<void> pay() async {
    try {
      emit(PaymentState<String>.loading());
      final PaymentStatus paymentStatus =
          await createPayment(courePrice: teacherModel.coursePrice);
      emit(PaymentState<String>.success(paymentStatus.data?.url ?? ""));
    } catch (e) {
      emit(PaymentState<String>.failure(e.toString()));
    }
  }

  Future<void> getTeacherData() async {
    try {
      emit(PaymentState<TeacherModel>.loading());
      teacherModel = await _getTeacherDataUseCase.execute(
          teacherId: studentModel.teacherId);
      emit(PaymentState<TeacherModel>.success(teacherModel));
    } on Exception catch (e) {
      emit(PaymentState<TeacherModel>.failure(e.toString()));
    }
  }

  Future<void> checkPayment(UrlChange url) async {
    if (url.url!.contains("https://dev.fawaterk.com/success")) {
      try {
        emit(PaymentState.loading());
        final String invoiceId =
            Uri.parse(url.url!).queryParameters['invoice_id'] ?? "";
        final DatabasePaymentModel opration = DatabasePaymentModel(
          invoiceId: invoiceId,
          paymentStatus: 'success',
          paymentDate: DateTime.now().toString(),
          firstName: studentModel.firstName,
          lastName: studentModel.lastName,
          email: studentModel.email,
          phone: studentModel.phone,
        );
        await addStudent();
        await _saveSuccessPaymentUseCase.execute(
            databasePaymentModel: opration);
        emit(PaymentState<bool>.success(true));
      } catch (e) {
        emit(PaymentState<String>.failure(e.toString()));
      }
    }
  }

  Future<void> addStudent() async {
    await _addStudentUseCase.execute(student: studentModel);
  }
}
