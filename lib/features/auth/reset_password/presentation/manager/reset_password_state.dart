part of 'reset_password_cubit.dart';

@freezed
sealed class ResetPasswordState<T> with _$ResetPasswordState<T> {
  const factory ResetPasswordState.initial() = Initial;
  const factory ResetPasswordState.loading() = Loading;
  const factory ResetPasswordState.success() = Success;
  const factory ResetPasswordState.failure(String errorMessage) = Failure;
}
