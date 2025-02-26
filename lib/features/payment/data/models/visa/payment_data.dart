class VisaPaymentData {
  String? redirectTo;

  VisaPaymentData({this.redirectTo});

  factory VisaPaymentData.fromJson(Map<String, dynamic> json) =>
      VisaPaymentData(
        redirectTo: json['redirectTo'] as String?,
      );
}
