import 'cart_item.dart';
import '../../../../student_data/data/model/customer_model.dart';
import 'redirection_urls.dart';

class PaymentModel {
  int paymentMethodId;
  String? cartTotal;
  String? currency;
  String? invoiceNumber;
  CustomerModel? customer;
  RedirectionUrls? redirectionUrls;
  List<CartItem>? cartItems;

  PaymentModel({
    required this.paymentMethodId,
    this.cartTotal,
    this.currency,
    this.invoiceNumber,
    this.customer,
    this.redirectionUrls,
    this.cartItems,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        paymentMethodId: json['payment_method_id'] as int,
        cartTotal: json['cartTotal'] as String?,
        currency: json['currency'] as String?,
        invoiceNumber: json['invoice_number'] as String?,
        customer: json['customer'] == null
            ? null
            : CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
        redirectionUrls: json['redirectionUrls'] == null
            ? null
            : RedirectionUrls.fromJson(
                json['redirectionUrls'] as Map<String, dynamic>),
        cartItems: (json['cartItems'] as List<dynamic>?)
            ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'payment_method_id': paymentMethodId,
        'cartTotal': cartTotal,
        'currency': currency,
        'invoice_number': invoiceNumber,
        'customer': customer?.toJson(),
        'redirectionUrls': redirectionUrls?.toJson(),
        'cartItems': cartItems?.map((e) => e.toJson()).toList(),
      };
}
