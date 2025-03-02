part of 'register_cubit.dart';

@freezed
class RegisterState<T> with _$RegisterState<T> {
  const factory RegisterState.initial() = Initial;
  const factory RegisterState.updateUI() = UpdateUI;
  const factory RegisterState.loading() = Loading;
  const factory RegisterState.success(T data) = Success;
  const factory RegisterState.failure(String message) = Failure;
}
