import 'package:mrjoo/core/utils/enums/payment_methods_enum.dart';

import 'payment_data.dart';

class Meeza {
  int? invoiceId;
  String? invoiceKey;
  MeezaPaymentData? paymentData;
  PaymentMethodsEnum paymentMethod = PaymentMethodsEnum.meeza;

  Meeza({this.invoiceId, this.invoiceKey, this.paymentData});

  factory Meeza.fromJson(Map<String, dynamic> json) => Meeza(
        invoiceId: json['invoice_id'] as int?,
        invoiceKey: json['invoice_key'] as String?,
        paymentData: json['payment_data'] == null
            ? null
            : MeezaPaymentData.fromJson(
                json['payment_data'] as Map<String, dynamic>),
      );
}
