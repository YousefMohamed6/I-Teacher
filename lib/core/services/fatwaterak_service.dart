import 'package:mrjoo/core/services/api_service.dart';
import 'package:mrjoo/core/utils/constants/keys.dart';
import 'package:mrjoo/core/utils/constants/urls.dart';
import 'package:mrjoo/core/utils/json_hander.dart';
import 'package:mrjoo/features/payment/data/models/payment/payment.dart';

class FawaterkService {
  final ApiService _api = ApiService();

  Future<List> fetchPaymentMethods() async {
    final body = await _api.get(
      url: AppUrls.kFawaterakAuthUrl,
      token: AppKeys.kFawaterakToken,
    );
    return body['data'];
  }

  Future<Map<String, dynamic>> sendPaymentRequest({
    required PaymentModel paymentModel,
  }) async {
    final body = await _api.post(
      url: AppUrls.kFawaterakPayUrl,
      body: paymentModel.toJson(),
      token: AppKeys.kFawaterakToken,
    );
    return JsonHandler.toJson(body: body);
  }
}
