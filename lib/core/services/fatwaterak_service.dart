import 'package:iteacher/core/services/api_service.dart';
import 'package:iteacher/core/utils/constants/keys.dart';
import 'package:iteacher/core/utils/constants/app_urls.dart';
import 'package:iteacher/core/utils/helper/json_handler.dart';
import 'package:iteacher/features/payment/data/models/payment/payment.dart';

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
