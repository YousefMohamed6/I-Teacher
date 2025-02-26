class PaymentMethodsModel {
  final int paymentId;
  final String nameEn;
  final String nameAr;
  final bool redirect;
  final String logo;

  PaymentMethodsModel({
    required this.paymentId,
    required this.nameEn,
    required this.nameAr,
    required this.redirect,
    required this.logo,
  });

  factory PaymentMethodsModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodsModel(
      paymentId: json['paymentId'] as int,
      nameEn: json['name_en'] as String,
      nameAr: json['name_ar'] as String,
      redirect: bool.tryParse(json['redirect'].toString()) ?? false,
      logo: json['logo'] as String,
    );
  }
}
