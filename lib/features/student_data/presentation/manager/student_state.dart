part of 'student_cubit.dart';

@freezed
class StudentState<T> with _$StudentState<T> {
  const factory StudentState.initial() = Initial;
  const factory StudentState.loading() = Loading;
  const factory StudentState.success(T data) = Success;
  const factory StudentState.failure(String message) = Failure;
}
