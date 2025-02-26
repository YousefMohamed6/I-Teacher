import 'package:mrjoo/core/utils/constants/links.dart';
import 'package:mrjoo/core/utils/services/api_service.dart';

import '../../../features/customer/data/model/customer_model.dart';

class Fawaterk {
  static final ApiService _api = ApiService();

  Future<dynamic> fetchPaymentMethods() async {
    var body = await _api.get(
        url: AppUrls.kFawaterakAuthUrl, token: AppUrls.kFawaterakToken);
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
      url: AppUrls.kFawaterakPayUrl,
      body: body,
      token: AppUrls.kFawaterakToken,
    );
    var url = responseBody['data']['payment_data']['redirectTo'];
    var invoiceId = responseBody['data']['invoice_id'];
    return {'invoiceId': invoiceId, 'url': url};
  }
}
