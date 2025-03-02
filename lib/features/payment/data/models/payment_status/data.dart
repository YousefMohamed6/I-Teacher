class Data {
  String? url;
  String? invoiceKey;
  int? invoiceId;

  Data({this.url, this.invoiceKey, this.invoiceId});

  factory Data.fromJson(
    Map<String, dynamic> json,
  ) =>
      Data(
        url: json['url'] as String?,
        invoiceKey: json['invoice_Key'] as String?,
        invoiceId: json['invoice_Id'] as int?,
      );
}
