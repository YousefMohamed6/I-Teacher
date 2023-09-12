import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/links.dart';
import 'package:mrjoo/core/utils/helper.dart';
import 'package:mrjoo/features/payment/data/payment_cubit/payment_state.dart';
import 'package:mrjoo/core/utils/api.dart';
import 'package:mrjoo/core/utils/fatwaterak_getway.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  bool isVisa = true;
  bool isWallets = false;
  int invoiceId = 0;
  final Api _api = Api();
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
          url: kTransactionFawaterak + invoiceId.toString(),
          token: kFawaterakToken);
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
      if (plateform()) {
        emit(ProcessSuccess());
      } else {
        urlLauncher(url: url);
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
      if (plateform()) {
        emit(ProcessSuccess());
      } else {
        urlLauncher(url: url);
        emit(PaymentInitial());
      }
    } catch (ex) {
      emit(ProcessFailure());
    }
  }
}
