import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/consts/links.dart';
import 'package:mrjoo/cubits/payment/payment_state.dart';
import 'package:mrjoo/helper/api.dart';
<<<<<<< HEAD
=======
import 'package:mrjoo/helper/show_message.dart';
import 'package:mrjoo/screens/register_page.dart';
>>>>>>> b2db2189bd5d52409229ac81e9bf8c27e25b0840
import 'package:mrjoo/services/fatwaterak_getway.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  bool isVisa = true;
  bool isWallets = false;
  int invoiceId = 0;
<<<<<<< HEAD
  final Api _api = Api();
  String url = '';
  final key = UniqueKey();

=======
  bool isLoading = false;
  final Api _api = Api();
  String url = '';
  final key = UniqueKey();
>>>>>>> b2db2189bd5d52409229ac81e9bf8c27e25b0840
  void changePaymentType() {
    isVisa = !isVisa;
    isWallets = !isWallets;
    emit(PaymentInitial());
  }

<<<<<<< HEAD
  void paymentLoading() {
    emit(ProcessSuccess());
  }

  Future<void> checkPayment() async {
    emit(PaymentLoading());
=======
  Future<void> checkPayment(context, {required invoiceId}) async {
>>>>>>> b2db2189bd5d52409229ac81e9bf8c27e25b0840
    try {
      var response = await _api.get(
          url: kTransactionFawaterak + invoiceId.toString(),
          token: kFawaterakToken);
      var paymentStatus = response['data']['invoice_transactions'][0]['status'];
      if (paymentStatus == 'success') {
        emit(Paid());
<<<<<<< HEAD
      } else {
        emit(PaymentFaild());
      }
    } catch (ex) {
      emit(ProcessFailure());
=======
        ShowMessage.show(context, msg: 'Payment Success');
        Navigator.popAndPushNamed(context, RegisterPage.id);
      } else {
        ShowMessage.show(context, msg: 'Payment Failed');
      }
    } catch (ex) {
      ShowMessage.show(context, msg: 'You not Register');
>>>>>>> b2db2189bd5d52409229ac81e9bf8c27e25b0840
    }
  }

  Future<dynamic> visa({required customerModel}) async {
    emit(PaymentLoading());
    try {
      var data = await Fawaterk()
          .sendPaymentRequest(customerData: customerModel, paymentMethodId: 2);
<<<<<<< HEAD
      emit(ProcessSuccess());
      invoiceId = data['invoiceId'];
      url = data['url'];
    } catch (ex) {
      emit(ProcessFailure());
    }
  }

  Future<dynamic> wellats({required customerModel}) async {
=======
      emit(PaymentSuccess());
      invoiceId = data['invoiceId'];
      url = data['url'];
    } catch (ex) {
      emit(PaymentFailure());
    }
  }

  Future<dynamic> wellats(context, {required customerModel}) async {
>>>>>>> b2db2189bd5d52409229ac81e9bf8c27e25b0840
    emit(PaymentLoading());
    try {
      var data = await Fawaterk()
          .sendPaymentRequest(customerData: customerModel, paymentMethodId: 4);
      invoiceId = data['invoiceId'];
      url = data['url'];
<<<<<<< HEAD
      emit(ProcessSuccess());
    } catch (ex) {
      emit(ProcessFailure());
=======
      emit(PaymentSuccess());
    } catch (ex) {
      emit(PaymentFailure());
      ShowMessage.show(context, msg: 'Something wrong try again');
>>>>>>> b2db2189bd5d52409229ac81e9bf8c27e25b0840
    }
  }
}
