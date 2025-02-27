part of 'payment_cubit.dart';

@freezed
class PaymentState<T> with _$PaymentState<T> {
  const factory PaymentState.initial() = Initial;
  const factory PaymentState.loading() = Loading;
  const factory PaymentState.success(T data) = Success;
  const factory PaymentState.failure(String message) = Failure;
}