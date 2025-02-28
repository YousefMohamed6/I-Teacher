import 'package:mrjoo/features/payment/data/models/payment/payment.dart';
import 'package:mrjoo/features/payment/data/models/payment_methods/payment_methods.dart';
import 'package:mrjoo/features/payment/data/models/payment_status/payment_status.dart';

abstract class IPaymentRepo {
  Future<List<PaymentMethodsModel>> getPaymentMethods();
  Future<PaymentStatus> sendPaymentRequest(
      {required PaymentModel paymentModel});
  Future<String> getPrice();
}
