import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mrjoo/features/payment/data/models/payment/payment.dart';
import 'package:mrjoo/features/payment/data/models/payment/redirection_urls.dart';
import 'package:mrjoo/features/payment/data/models/payment_methods/payment_methods.dart';
import 'package:mrjoo/features/payment/data/models/payment_status/payment_status.dart';
import 'package:mrjoo/features/payment/domain/use_cases/fetch_payment_methods_use_case.dart';
import 'package:mrjoo/features/payment/domain/use_cases/get_course_price_use_case.dart';
import 'package:mrjoo/features/payment/domain/use_cases/send_payment_request.dart';
import 'package:mrjoo/features/student_data/data/model/customer_model.dart';

part 'payment_cubit.freezed.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final FetchPaymentMethodsUseCase _fetchPaymentMethodsUseCase;
  final SendPaymentRequestUseCase _sendPaymentRequestUseCase;
  final GetCoursePriceUseCase _getCoursePriceUseCase;
  PaymentCubit(
    this._fetchPaymentMethodsUseCase,
    this._sendPaymentRequestUseCase,
    this._getCoursePriceUseCase,
  ) : super(PaymentState.initial());
  late CustomerModel customerModel;
  void initState(CustomerModel customer) {
    customerModel = customer;
  }

  List<PaymentMethodsModel> paymentMethods = [];
  Future<void> fetchPaymentMethods() async {
    try {
      emit(PaymentState<List<PaymentMethodsModel>>.loading());
      paymentMethods = await _fetchPaymentMethodsUseCase.execute();
      emit(PaymentState<List<PaymentMethodsModel>>.success(paymentMethods));
    } catch (e) {
      emit(PaymentState<List<PaymentMethodsModel>>.failure(e.toString()));
    }
  }

  Future<void> createPayment({required int paymentMethodId}) async {
    try {
      emit(PaymentState<PaymentStatus>.loading());
      final String courePrice = await getCoursePrice();
      final paymentStatus = await _sendPaymentRequestUseCase.execute(
        paymentModel: PaymentModel(
          paymentMethodId: paymentMethodId,
          cartTotal: courePrice,
          customer: customerModel,
          redirectionUrls: RedirectionUrls.fromJson(
            {
              'successUrl': 'https://dev.fawaterk.com/success',
              'failUrl': 'https://dev.fawaterk.com/fail',
              'pendingUrl': 'https://dev.fawaterk.com/pending',
            },
          ),
        ),
      );
      emit(PaymentState<PaymentStatus>.success(paymentStatus));
    } catch (e) {
      emit(PaymentState<PaymentStatus>.failure(e.toString()));
    }
  }

  Future<String> getCoursePrice() async {
    return await _getCoursePriceUseCase.execute();
  }

  Future<void> checkPayment() async {}
}
