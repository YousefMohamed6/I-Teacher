part of 'rest_password_cubit.dart';

@freezed
sealed class RestPasswordState<T> with _$RestPasswordState<T> {
  const factory RestPasswordState.initial() = Initial;
  const factory RestPasswordState.loading() = Loading;
  const factory RestPasswordState.success() = Success;
  const factory RestPasswordState.failure(String errorMessage) = Failure;
}
