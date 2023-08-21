import 'package:flutter/material.dart';
import 'package:mrjoo/consts/links.dart';
import 'package:mrjoo/helper/show_message.dart';
import 'package:mrjoo/helper/api.dart';
import 'package:mrjoo/screens/register_page.dart';
import '../models/customer_model.dart';

class Fawaterk {
  static final Api _api = Api();

  Future<dynamic> fetchPaymentMethods() async {
    var body = await _api.get(url: kFawaterakAuthUrl, token: kFawaterakToken);
    return body;
  }

  Future<dynamic> sendPaymentRequest({
    required CustomerModel customerData,
    required int paymentMethodId,
  }) async {
    Map<String, dynamic> body = {
      'payment_method_id': paymentMethodId,
      'cartTotal': '100',
      'currency': 'EGP',
      'customer': {
        'first_name': customerData.fristName,
        'last_name': customerData.lastName,
        'email': customerData.email,
        'phone': customerData.phone,
        'address': 'Tanta',
      },
      'redirectionUrls': {
        'successUrl': 'https://dev.fawaterk.com/success',
        'failUrl': 'https://dev.fawaterk.com/fail',
        'pendingUrl': 'https://dev.fawaterk.com/pending',
      },
      'cartItems': [
        {
          'name': 'Flutter Corse',
          'price': '100',
          'quantity': '1',
        },
      ],
    };

    dynamic responseBody = await _api.post(
      url: kFawaterakPayUrl,
      body: body,
      token: kFawaterakToken,
    );
    var url = responseBody['data']['payment_data']['redirectTo'];
    var invoiceId = responseBody['data']['invoice_id'];
    return {'invoiceId': invoiceId, 'url': url};
  }

  static Future<void> checkPayment(context, {required transactionId}) async {
    try {
      var response = await _api.get(
          url: kTransactionFawaterak + transactionId.toString(),
          token: kFawaterakToken);
      var paymentStatus = response['data']['invoice_transactions'][0]['status'];
      if (paymentStatus == 'success') {
        ShowMessage.show(context, msg: 'Payment Success');
        Navigator.popAndPushNamed(context, RegisterPage.id);
      } else {
        ShowMessage.show(context, msg: 'Payment Failed');
      }
    } catch (ex) {
      ShowMessage.show(context, msg: 'You not Register');
    }
  }
}
