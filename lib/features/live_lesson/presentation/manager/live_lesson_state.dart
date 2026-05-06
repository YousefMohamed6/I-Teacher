part of 'live_lesson_cubit.dart';

@freezed
sealed class LiveLessonState with _$LiveLessonState {
  const factory LiveLessonState.initial() = Initial;
  const factory LiveLessonState.loading() = Loading;
  const factory LiveLessonState.success({required LiveLessonEntity lesson}) =
      Success;
  const factory LiveLessonState.failure({required String message}) = Failure;
}
