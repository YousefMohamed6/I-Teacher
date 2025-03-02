import 'data.dart';

class PaymentStatus {
  String? status;
  Data? data;
  PaymentStatus({this.status, this.data});

  factory PaymentStatus.fromJson(Map<String, dynamic> json) => PaymentStatus(
        status: json['status'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(
                json['data'] as Map<String, dynamic>,
              ),
      );
}
