import 'package:mrjoo/core/utils/constants/urls.dart';
import 'package:mrjoo/core/services/api_service.dart';
import 'package:mrjoo/features/payment/data/models/payment/payment.dart';

class FawaterkService {
  static final ApiService _api = ApiService();

  Future<List> fetchPaymentMethods() async {
    final body = await _api.get(
      url: AppUrls.kFawaterakAuthUrl,
      token: AppUrls.kFawaterakToken,
    );
    return body['data'];
  }

  Future<Map<String, dynamic>> sendPaymentRequest({
    required PaymentModel paymentModel,
    required int paymentMethodId,
  }) async {
    final body = await _api.post(
      url: AppUrls.kFawaterakPayUrl,
      body: paymentModel.toJson(),
      token: AppUrls.kFawaterakToken,
    );
    return body['data'];
  }
}
