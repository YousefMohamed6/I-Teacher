class FawryPaymentData {
  String? fawryCode;
  String? expireDate;

  FawryPaymentData({this.fawryCode, this.expireDate});

  factory FawryPaymentData.fromJson(Map<String, dynamic> json) =>
      FawryPaymentData(
        fawryCode: json['fawryCode'] as String?,
        expireDate: json['expireDate'] as String?,
      );
}
