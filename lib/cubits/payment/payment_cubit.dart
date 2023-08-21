import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/consts/links.dart';
import 'package:mrjoo/cubits/payment/payment_state.dart';
import 'package:mrjoo/helper/api.dart';
import 'package:mrjoo/services/fatwaterak_getway.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  bool isVisa = true;
  bool isWallets = false;
  int invoiceId = 0;
  final Api _api = Api();
  String url = '';
  final key = UniqueKey();

  void changePaymentType() {
    isVisa = !isVisa;
    isWallets = !isWallets;
    emit(PaymentInitial());
  }

  void paymentLoading() {
    emit(ProcessSuccess());
  }

  Future<void> checkPayment() async {
    emit(PaymentLoading());
    try {
      var response = await _api.get(
          url: kTransactionFawaterak + invoiceId.toString(),
          token: kFawaterakToken);
      var paymentStatus = response['data']['invoice_transactions'][0]['status'];
      if (paymentStatus == 'success') {
        emit(Paid());
      } else {
        emit(PaymentFaild());
      }
    } catch (ex) {
      emit(ProcessFailure());
    }
  }

  Future<dynamic> visa({required customerModel}) async {
    emit(PaymentLoading());
    try {
      var data = await Fawaterk()
          .sendPaymentRequest(customerData: customerModel, paymentMethodId: 2);
      emit(ProcessSuccess());
      invoiceId = data['invoiceId'];
      url = data['url'];
    } catch (ex) {
      emit(ProcessFailure());
    }
  }

  Future<dynamic> wellats({required customerModel}) async {
    emit(PaymentLoading());
    try {
      var data = await Fawaterk()
          .sendPaymentRequest(customerData: customerModel, paymentMethodId: 4);
      invoiceId = data['invoiceId'];
      url = data['url'];
      emit(ProcessSuccess());
    } catch (ex) {
      emit(ProcessFailure());
    }
  }
}
