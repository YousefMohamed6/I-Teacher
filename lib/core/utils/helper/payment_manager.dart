import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';

sealed class PaymentManager {
  static Future<void> checkPayment({
    required UrlChange url,
    required VoidCallback onSuccess,
    required VoidCallback onFail,
  }) async {
    if (url.url!.contains("https://dev.fawaterk.com/success")) {
      onSuccess();
    } else if (url.url!.contains("https://dev.fawaterk.com/fail")) {
      onFail();
    }
  }
}
