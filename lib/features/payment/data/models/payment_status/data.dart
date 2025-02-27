class Data {
  String? url;
  String? invoiceKey;
  int? invoiceId;

  Data({this.url, this.invoiceKey, this.invoiceId});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        url: json['url'] as String?,
        invoiceKey: json['invoiceKey'] as String?,
        invoiceId: json['invoiceId'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'invoiceKey': invoiceKey,
        'invoiceId': invoiceId,
      };
}
