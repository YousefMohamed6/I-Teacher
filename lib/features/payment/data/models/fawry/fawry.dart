import 'package:mrjoo/core/utils/enums/payment_methods_enum.dart';

import 'payment_data.dart';

class Fawry {
  int? invoiceId;
  String? invoiceKey;
  FawryPaymentData? paymentData;
  PaymentMethodsEnum paymentMethod = PaymentMethodsEnum.fawry;
  Fawry({this.invoiceId, this.invoiceKey, this.paymentData});

  factory Fawry.fromJson(Map<String, dynamic> json) => Fawry(
        invoiceId: json['invoice_id'] as int?,
        invoiceKey: json['invoice_key'] as String?,
        paymentData: json['payment_data'] == null
            ? null
            : FawryPaymentData.fromJson(
                json['payment_data'] as Map<String, dynamic>),
      );
}
