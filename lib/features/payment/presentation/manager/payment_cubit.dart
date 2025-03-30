import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iteacher/features/payment/data/models/data_base_payments.dart';
import 'package:iteacher/features/payment/data/models/payment/cart_item.dart';
import 'package:iteacher/features/payment/data/models/payment/payment.dart';
import 'package:iteacher/features/payment/data/models/payment/redirection_urls.dart';
import 'package:iteacher/features/payment/data/models/payment_status/payment_status.dart';
import 'package:iteacher/features/payment/domain/use_cases/get_teacher_data_use_case.dart';
import 'package:iteacher/features/payment/domain/use_cases/save_success_payment.dart';
import 'package:iteacher/features/payment/domain/use_cases/send_payment_request.dart';
import 'package:iteacher/features/student_data/data/model/student_model.dart';
import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'payment_cubit.freezed.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final SendPaymentRequestUseCase _sendPaymentRequestUseCase;
  final GetTeacherDataUseCase _getTeacherDataUseCase;
  final SavePaymentStatusUseCase _savePaymentStatusUseCase;
  PaymentCubit(
    this._sendPaymentRequestUseCase,
    this._getTeacherDataUseCase,
    this._savePaymentStatusUseCase,
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

  DatabasePaymentModel get paymentOpration => DatabasePaymentModel(
        invoiceId: '',
        paymentStatus: '',
        paymentDate: DateTime.now().toString(),
        firstName: studentModel.firstName,
        lastName: studentModel.lastName,
        email: studentModel.email,
        phone: studentModel.phone,
      );
  Future<void> checkPayment(UrlChange url) async {
    final String invoiceId =
        Uri.parse(url.url!).queryParameters['invoice_id'] ?? "";
    try {
      if (url.url!.contains("https://dev.fawaterk.com/success")) {
        emit(PaymentState.loading());
        await _savePaymentStatusUseCase.execute(
          databasePaymentModel: paymentOpration
            ..invoiceId = invoiceId
            ..paymentStatus = 'success',
        );
        emit(PaymentState<bool>.success(true));
      } else if (url.url!.contains("https://dev.fawaterk.com/fail")) {
        await _savePaymentStatusUseCase.execute(
          databasePaymentModel: paymentOpration
            ..invoiceId = invoiceId
            ..paymentStatus = 'fail',
        );
        emit(PaymentState<bool>.failure(''));
      }
    } catch (e) {
      emit(PaymentState<String>.failure(e.toString()));
    }
  }
}
