import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mrjoo/features/course/domain/use_case/get_student_data_use_case.dart';
import 'package:mrjoo/features/course/domain/use_case/get_teacher_data_use_case.dart';
import 'package:mrjoo/features/profile/data/model/teacher_model.dart';
import 'package:mrjoo/features/student_data/data/model/student_model.dart';

part 'course_cubit.freezed.dart';
part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final GetTeacherDataUseCase _getTeacherDataUseCase;
  final GetStudentDataUseCase _getStudentDataUseCase;
  CourseCubit(
    this._getTeacherDataUseCase,
    this._getStudentDataUseCase,
  ) : super(CourseState.initial());
  final TextEditingController courseCtrl = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late StudentModel student;
  Future<void> fetchCourseLink() async {
    emit(CourseState.loading());
    try {
      emit(CourseState.loading());
      final studentEmail = FirebaseAuth.instance.currentUser!.email!;
      student = await getStudentData(studentEmail: studentEmail);
      final teacher = await getTeacherData(teacherId: student.teacherId);
      final courseLink = teacher.courseLink;
      emit(CourseState<String>.success(courseLink));
    } catch (e) {
      emit(CourseState.failure(e.toString()));
    }
  }

  Future<TeacherModel> getTeacherData({required String teacherId}) async {
    return await _getTeacherDataUseCase.execute(teacherId: teacherId);
  }

  Future<StudentModel> getStudentData({required String studentEmail}) async {
    return await _getStudentDataUseCase.execute(studentEmail: studentEmail);
  }
}
