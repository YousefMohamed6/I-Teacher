part of 'course_cubit.dart';

@freezed
class CourseState<T> with _$CourseState<T> {
  const factory CourseState.initial() = Initial;
  const factory CourseState.loading() = Loading;
  const factory CourseState.success(T data) = Success;
  const factory CourseState.failure(String message) = Failure;
}
