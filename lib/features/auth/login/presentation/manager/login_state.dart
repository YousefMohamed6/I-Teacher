part of 'login_cubit.dart';

@freezed
sealed class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.success(T data) = Success;
  const factory LoginState.failure({required String errMessage}) = Failure;
  const factory LoginState.updateUI() = UpdateUI;
}
