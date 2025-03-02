import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mrjoo/features/student_data/data/model/student_model.dart';
import 'package:mrjoo/features/student_data/domain/use_cases/get_teachers_ids_use_case.dart';

part 'student_cubit.freezed.dart';
part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  final GetTeachersIdsUseCase _getTeachersIdsUseCase;
  StudentCubit(
    this._getTeachersIdsUseCase,
  ) : super(StudentState.initial());
  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final teacherIdTextController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  StudentModel get studentData => StudentModel(
        firstName: firstNameTextController.text.trim(),
        lastName: lastNameTextController.text.trim(),
        email: emailTextController.text.trim(),
        phone: phoneTextController.text.trim(),
        address: addressTextController.text.trim(),
        teacherId: teacherIdTextController.text.trim(),
        expiryDate: DateTime.now().add(Duration(days: 30)).toIso8601String(),
        subscriptionDate: DateTime.now().toIso8601String(),
      );
  Future<void> checkTeacherId() async {
    try {
      emit(StudentState.loading());
      final String teacherId = teacherIdTextController.text;
      final List<String> teachers = await _getTeachersIdsUseCase.execute();
      emit(StudentState<bool>.success(teachers.contains(teacherId)));
    } catch (e) {
      emit(StudentState.failure(e.toString()));
    }
  }
}
