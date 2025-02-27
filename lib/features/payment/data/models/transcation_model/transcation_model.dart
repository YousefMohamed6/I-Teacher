class TranscationModel {
  int? invoiceId;
  String? invoiceKey;
  DateTime? dueDate;
  dynamic payLoad;
  String? frequency;
  String? customDueDate;
  String? customerEmail;
  String? paymentMethod;
  double? commission;
  String? currency;
  double? total;
  int? paid;
  DateTime? paidAt;
  DateTime? invoiceCreatedAt;

  TranscationModel({
    this.invoiceId,
    this.invoiceKey,
    this.dueDate,
    this.payLoad,
    this.frequency,
    this.customDueDate,
    this.customerEmail,
    this.paymentMethod,
    this.commission,
    this.currency,
    this.total,
    this.paid,
    this.paidAt,
    this.invoiceCreatedAt,
  });

  factory TranscationModel.fromJson(Map<String, dynamic> json) {
    return TranscationModel(
      invoiceId: json['invoice_id'] as int?,
      invoiceKey: json['invoice_key'] as String?,
      dueDate: json['due_date'] == null
          ? null
          : DateTime.parse(json['due_date'] as String),
      payLoad: json['pay_load'] as dynamic,
      frequency: json['frequency'] as String?,
      customDueDate: json['custom_due_date'] as String?,
      customerEmail: json['customer_email'] as String?,
      paymentMethod: json['payment_method'] as String?,
      commission: (json['commission'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      total: (json['total'] as num?)?.toDouble(),
      paid: json['paid'] as int?,
      paidAt: json['paid_at'] == null
          ? null
          : DateTime.parse(json['paid_at'] as String),
      invoiceCreatedAt: json['invoice_created_at'] == null
          ? null
          : DateTime.parse(json['invoice_created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'invoice_id': invoiceId,
        'invoice_key': invoiceKey,
        'due_date': dueDate?.toIso8601String(),
        'pay_load': payLoad,
        'frequency': frequency,
        'custom_due_date': customDueDate,
        'customer_email': customerEmail,
        'payment_method': paymentMethod,
        'commission': commission,
        'currency': currency,
        'total': total,
        'paid': paid,
        'paid_at': paidAt?.toIso8601String(),
        'invoice_created_at': invoiceCreatedAt?.toIso8601String(),
      };
}
