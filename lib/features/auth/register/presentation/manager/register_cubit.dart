import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iteacher/core/exceptions/accept_terms_exception.dart';
import 'package:iteacher/core/services/sf_service.dart';
import 'package:iteacher/core/utils/constants/sf_keys.dart';
import 'package:iteacher/features/auth/register/domain/use_case/create_student_use_case.dart';
import 'package:iteacher/features/auth/register/domain/use_case/create_user_with_email_and_password.dart';
import 'package:iteacher/features/student_data/data/model/student_model.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final CreateUserWithEmailAndPasswordUseCase _createUserWithEmailAndPassword;
  final CreateStudentUseCase _createStudentUseCase;
  RegisterCubit(
    this._createUserWithEmailAndPassword,
    this._createStudentUseCase,
  ) : super(RegisterState.initial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController firstNameTextController = TextEditingController();
  final TextEditingController lastNameTextController = TextEditingController();
  late StudentModel _studentModel;
  bool _obscuretext = true;
  bool isAccept = true;
  bool get obscuretext => _obscuretext;
  void changeAccpetTermsAndPrivacy() {
    isAccept = !isAccept;
    setState();
  }

  void initStudentModel(StudentModel student) {
    _studentModel = student;
    firstNameTextController.text = _studentModel.firstName;
    lastNameTextController.text = _studentModel.lastName;
    emailTextController.text = _studentModel.email;
  }

  StudentModel get student => StudentModel(
        firstName: firstNameTextController.text,
        lastName: lastNameTextController.text,
        email: emailTextController.text,
        phone: _studentModel.phone,
        address: _studentModel.address,
        imageBase64: _studentModel.imageBase64,
        expiryDate: _studentModel.expiryDate,
        subscriptionDate: _studentModel.subscriptionDate,
        teacherId: _studentModel.teacherId,
      );
  void changeObscureText() {
    _obscuretext = !_obscuretext;
    setState();
  }

  void setState() {
    emit(RegisterState.initial());
    emit(RegisterState.updateUI());
  }

  Future<void> createStudent() async {
    try {
      emit(RegisterState.loading());
      await _createStudentUseCase.execute(student: student);
    } catch (e) {
      emit(RegisterState<String>.failure(e.toString()));
    }
  }

  Future<void> signUp() async {
    emit(RegisterState.loading());
    if (formKey.currentState!.validate()) {
      await _createUserWithEmailAndPassword.execute(
        email: emailTextController.text,
        password: passwordTextController.text,
        displyName:
            '${firstNameTextController.text} ${lastNameTextController.text}',
      );
    } else {
      throw Exception('Form is not valid');
    }
  }

  Future<void> cacheUser() async {
    await SharedPreferencesService.saveString(
        SfKeys.userEmail, emailTextController.text);
  }

  Future<void> registerStudent() async {
    try {
      if (isAccept) {
        await signUp();
        await createStudent();
        await cacheUser();
        emit(RegisterState<bool>.success(true));
      } else {
        throw AcceptTermsException();
      }
    } on AcceptTermsException catch (e) {
      emit(RegisterState<AcceptTermsException>.failure(e.toString()));
    } on FirebaseException catch (e) {
      emit(RegisterState<String>.failure(e.code));
    } catch (e) {
      emit(RegisterState.failure(e.toString()));
    }
  }

  @override
  Future<void> close() async {
    emailTextController.dispose();
    passwordTextController.dispose();
    firstNameTextController.dispose();
    lastNameTextController.dispose();
    super.close();
  }
}
