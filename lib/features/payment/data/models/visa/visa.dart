import 'package:mrjoo/core/utils/enums/payment_methods_enum.dart';

import 'payment_data.dart';

class Visa {
  int? invoiceId;
  String? invoiceKey;
  VisaPaymentData? paymentData;
  PaymentMethodsEnum paymentMethod = PaymentMethodsEnum.visaOrMasterCard;

  Visa({this.invoiceId, this.invoiceKey, this.paymentData});

  factory Visa.fromJson(Map<String, dynamic> json) => Visa(
        invoiceId: json['invoice_id'] as int?,
        invoiceKey: json['invoice_key'] as String?,
        paymentData: json['payment_data'] == null
            ? null
            : VisaPaymentData.fromJson(
                json['payment_data'] as Map<String, dynamic>),
      );
}
