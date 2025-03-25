import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iteacher/core/exceptions/pick_image_exception.dart';
import 'package:iteacher/features/student_data/data/model/student_model.dart';
import 'package:iteacher/features/student_data/domain/use_cases/get_teachers_ids_use_case.dart';
import 'package:iteacher/features/student_data/domain/use_cases/pick_student_image_use_case.dart';

part 'student_cubit.freezed.dart';
part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  final GetTeachersIdsUseCase _getTeachersIdsUseCase;
  final PickStudentImageUseCase _pickStudentImageUseCase;
  StudentCubit(
    this._getTeachersIdsUseCase,
    this._pickStudentImageUseCase,
  ) : super(StudentState.initial());
  final firstNameTextController = TextEditingController(text: 'Yousef');
  final lastNameTextController = TextEditingController(text: 'Mohamed');
  final emailTextController =
      TextEditingController(text: 'Yousef.Mohamed.Flutter@gmail.com');
  final phoneTextController = TextEditingController(text: '+201067954536');
  final addressTextController = TextEditingController(text: 'El Santa');
  final teacherIdTextController = TextEditingController(text: '1');
  final studentImageController = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();

  StudentModel get studentData => StudentModel(
        firstName: firstNameTextController.text.trim(),
        lastName: lastNameTextController.text.trim(),
        email: emailTextController.text.trim(),
        phone: phoneTextController.text.trim(),
        address: addressTextController.text.trim(),
        teacherId: teacherIdTextController.text.trim(),
        expiryDate: DateTime.now().add(Duration(days: 30)),
        subscriptionDate: DateTime.now(),
        imageBase64: studentImageController.text,
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

  Future<void> pickImage() async {
    try {
      emit(StudentState.loading());
      studentImageController.text = await _pickStudentImageUseCase.execute();
      emit(StudentState<String>.success(studentImageController.text));
    } on PickGalleryImageException catch (e) {
      emit(StudentState<PickGalleryImageException>.failure(e.toString()));
    }
  }

  @override
  Future<void> close() async {
    firstNameTextController.dispose();
    lastNameTextController.dispose();
    emailTextController.dispose();
    phoneTextController.dispose();
    addressTextController.dispose();
    teacherIdTextController.dispose();
    studentImageController.dispose();
    super.close();
  }
}
