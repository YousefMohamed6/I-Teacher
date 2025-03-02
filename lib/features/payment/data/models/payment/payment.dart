import 'cart_item.dart';
import 'customer_model.dart';
import 'redirection_urls.dart';

class PaymentModel {
  String? cartTotal;
  String? currency;
  CustomerModel? customer;
  RedirectionUrls? redirectionUrls;
  List<CartItem>? cartItems;

  PaymentModel({
    this.cartTotal,
    this.currency,
    this.customer,
    this.redirectionUrls,
    this.cartItems,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        cartTotal: json['cartTotal'] as String?,
        currency: json['currency'] as String?,
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
        "cartTotal": cartTotal,
        "currency": currency,
        "customer": customer?.toJson(),
        "redirectionUrls": redirectionUrls?.toJson(),
        "cartItems": cartItems?.map((e) => e.toJson()).toList()
      };
}
