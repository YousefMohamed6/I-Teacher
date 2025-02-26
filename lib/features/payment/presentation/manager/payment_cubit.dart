import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/links.dart';
import 'package:mrjoo/core/utils/services/api.dart';
import 'package:mrjoo/core/utils/services/fatwaterak_getway.dart';
import 'package:mrjoo/core/utils/services/url_launcher.dart';
import 'package:mrjoo/features/payment/presentation/manager/payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  bool isVisa = true;
  bool isWallets = false;
  int invoiceId = 0;
  final ApiService _api = ApiService();
  String url = '';

  void changePaymentType({required bool isVisa}) {
    this.isVisa = isVisa;
    isWallets = !isVisa;
    emit(PaymentInitial());
  }

  Future<void> checkPayment() async {
    emit(PaymentLoading());
    try {
      var response = await _api.get(
          url: AppUrls.kTransactionFawaterak + invoiceId.toString(),
          token: AppUrls.kFawaterakToken);
      var paymentStatus = response['data']['invoice_transactions'][0]['status'];
      if (paymentStatus == 'success') {
        invoiceId = 0;
        emit(Paid());
      } else {
        invoiceId = 0;
        emit(PaymentFailure());
      }
    } catch (ex) {
      emit(PaymentFailure());
    }
  }

  Future<dynamic> pay({required customerModel}) async {
    isVisa
        ? await _visa(customerModel: customerModel)
        : await _wellats(customerModel: customerModel);
  }

  Future<dynamic> _visa({required customerModel}) async {
    emit(PaymentLoading());
    try {
      var data = await Fawaterk().sendPaymentRequest(
        customerData: customerModel,
        paymentMethodId: 2,
      );
      invoiceId = data['invoiceId'];
      url = data['url'];
      if (Platform.isAndroid || Platform.isIOS) {
        emit(ProcessSuccess());
      } else {
        UrlLauncher.launcher(url: url);
        emit(PaymentInitial());
      }
    } catch (ex) {
      emit(ProcessFailure());
    }
  }

  Future<dynamic> _wellats({required customerModel}) async {
    emit(PaymentLoading());
    try {
      var data = await Fawaterk().sendPaymentRequest(
        customerData: customerModel,
        paymentMethodId: 4,
      );
      invoiceId = data['invoiceId'];
      url = data['url'];
      if (Platform.isAndroid || Platform.isIOS) {
        emit(ProcessSuccess());
      } else {
        UrlLauncher.launcher(url: url);
        emit(PaymentInitial());
      }
    } catch (ex) {
      emit(ProcessFailure());
    }
  }
}
