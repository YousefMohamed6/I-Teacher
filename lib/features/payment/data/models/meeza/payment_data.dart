class MeezaPaymentData {
  int? meezaReference;
  String? meezaQrCode;

  MeezaPaymentData({this.meezaReference, this.meezaQrCode});

  factory MeezaPaymentData.fromJson(Map<String, dynamic> json) =>
      MeezaPaymentData(
        meezaReference: json['meezaReference'] as int?,
        meezaQrCode: json['meezaQrCode'] as String?,
      );
}
