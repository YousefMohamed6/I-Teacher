import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iteacher/features/live_lesson/domain/entities/live_lesson_entity.dart';

part 'live_lesson_state.dart';
part 'live_lesson_cubit.freezed.dart';

class LiveLessonCubit extends Cubit<LiveLessonState> {
  LiveLessonCubit() : super(const LiveLessonState.initial());

  Future<void> startLesson(LiveLessonEntity lesson) async {
    emit(const LiveLessonState.loading());
    try {
      // In a real app, you would create the room in your backend here
      emit(LiveLessonState.success(lesson: lesson));
    } catch (e) {
      emit(LiveLessonState.failure(message: e.toString()));
    }
  }

  Future<void> joinLesson(LiveLessonEntity lesson) async {
    emit(const LiveLessonState.loading());
    try {
      emit(LiveLessonState.success(lesson: lesson));
    } catch (e) {
      emit(LiveLessonState.failure(message: e.toString()));
    }
  }

  void endLesson() {
    emit(const LiveLessonState.initial());
  }
}
