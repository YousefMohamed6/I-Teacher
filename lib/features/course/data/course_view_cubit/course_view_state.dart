part of 'course_view_cubit.dart';

sealed class CourseState {}

final class CourseInitial extends CourseState {}

final class UpdateSucees extends CourseState {}

final class UpdateFailure extends CourseState {}

final class SignOut extends CourseState {}
