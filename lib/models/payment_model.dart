class PaymentModel {
  final int paymentMethodId;
  final String name;
  final String logoUrl;

  PaymentModel({
    required this.paymentMethodId,
    required this.name,
    required this.logoUrl,
  });
  factory PaymentModel.fromJsonData(jsonData) {
    return PaymentModel(
      paymentMethodId: jsonData['paymentId'],
      name: jsonData['name_en'],
      logoUrl: jsonData['logo'],
    );
  }
}
