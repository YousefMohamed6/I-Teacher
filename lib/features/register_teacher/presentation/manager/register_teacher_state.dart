part of 'register_teacher_cubit.dart';

@freezed
sealed class RegisterTeacherState<T> with _$RegisterTeacherState<T> {
  const factory RegisterTeacherState.initial() = Initial;
  const factory RegisterTeacherState.loading() = Loading;
  const factory RegisterTeacherState.success(T data) = Success;
  const factory RegisterTeacherState.error(String message) = Error;
  const factory RegisterTeacherState.updateUI() = UpdateUI;

}
