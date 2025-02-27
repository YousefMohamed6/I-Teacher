import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mrjoo/features/payment/data/models/payment_methods/payment_methods.dart';
import 'package:mrjoo/features/payment/domain/use_cases/fetch_payment_methods_use_case.dart';
import 'package:mrjoo/features/student_data/data/model/customer_model.dart';

part 'payment_cubit.freezed.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final FetchPaymentMethodsUseCase _fetchPaymentMethodsUseCase;
  PaymentCubit(
    this._fetchPaymentMethodsUseCase,
  ) : super(PaymentState.initial());
  late CustomerModel customerModel;
  void initState(CustomerModel customer) {
    customerModel = customer;
  }

  List<PaymentMethodsModel> paymentMethods = [];
  Future<void> fetchPaymentMethods() async {
    try {
      emit(PaymentState<List<PaymentMethodsModel>>.loading());
      final paymentMethods = await _fetchPaymentMethodsUseCase.execute();
      emit(PaymentState<List<PaymentMethodsModel>>.success(paymentMethods));
    } catch (e) {
      emit(PaymentState<List<PaymentMethodsModel>>.failure(e.toString()));
    }
  }

  Future<void> createPayment() async {}
  Future<void> checkPayment() async {}
}
