part of 'terms_and_conditions_cubit.dart';

@freezed
class TermsAndConditionsState<T> with _$TermsAndConditions<T> {
  const factory TermsAndConditionsState.initial() = Initial;
  const factory TermsAndConditionsState.loading() = Loading;
  const factory TermsAndConditionsState.success(T data) = Success;
  const factory TermsAndConditionsState.error(String message) = Error;
}
