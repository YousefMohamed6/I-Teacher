import 'package:mrjoo/core/utils/constants/firebase_keys.dart';

class DatabasePaymentModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  String invoiceId;
  String paymentStatus;
  final String paymentDate;

  DatabasePaymentModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.invoiceId,
    required this.paymentStatus,
    required this.paymentDate,
  });

  // تحويل JSON إلى Object
  factory DatabasePaymentModel.fromJson(Map<String, dynamic> json) {
    return DatabasePaymentModel(
      firstName: json[PaymentsKeys.kFirstNameField] ?? '',
      lastName: json[PaymentsKeys.kLastNameField] ?? '',
      email: json[PaymentsKeys.kEmailField] ?? '',
      phone: json[PaymentsKeys.kPhoneField] ?? '',
      invoiceId: json[PaymentsKeys.kInvoiceIdField] ?? '',
      paymentStatus: json[PaymentsKeys.kPaymentStatusField] ?? '',
      paymentDate: json[PaymentsKeys.kPaymentDateField] ?? '',
    );
  }

  // تحويل Object إلى JSON
  Map<String, dynamic> toJson() {
    return {
      PaymentsKeys.kFirstNameField: firstName,
      PaymentsKeys.kLastNameField: lastName,
      PaymentsKeys.kEmailField: email,
      PaymentsKeys.kPhoneField: phone,
      PaymentsKeys.kInvoiceIdField: invoiceId,
      PaymentsKeys.kPaymentStatusField: paymentStatus,
      PaymentsKeys.kPaymentDateField: paymentDate,
    };
  }
}
