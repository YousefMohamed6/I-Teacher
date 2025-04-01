part of 'teacher_profile_cubit.dart';

@freezed
class TeacherProfileState<T> with _$TeacherProfileState<T> {
  const factory TeacherProfileState.initial() = Initial;
  const factory TeacherProfileState.loading() = Loading;
  const factory TeacherProfileState.success(T data) = Success;
  const factory TeacherProfileState.failure(String message) = Failure;
  const factory TeacherProfileState.updateUI() = UpdateUI;
}
