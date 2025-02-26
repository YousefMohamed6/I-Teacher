part of 'privacy_policy_cubit.dart';

@freezed
class PrivacyPolicyState<T> with _$PrivacyPolicyState<T> {
  const factory PrivacyPolicyState.initial() = Initial;
  const factory PrivacyPolicyState.loading() = Loading;
  const factory PrivacyPolicyState.success(T data) = Success;
  const factory PrivacyPolicyState.error(String message) = Error;
}
