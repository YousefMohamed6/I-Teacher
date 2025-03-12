import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mrjoo/core/enums/user_role.dart';
import 'package:mrjoo/core/exceptions/unfound_user.dart';
import 'package:mrjoo/core/models/user_model.dart';
import 'package:mrjoo/features/auth/login/domain/use_cases/get_use_data_use_case.dart';
import 'package:mrjoo/features/auth/login/domain/use_cases/save_user_role_use_case%20copy.dart';
import 'package:mrjoo/features/auth/login/domain/use_cases/save_user_role_use_case.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final GetUserDataUseCase _getUserDataUseCase;
  final SaveUserRoleUseCase _saveUserRoleUseCase;
  final SaveUserEmailUseCase _saveUserEmailUseCase;

  LoginCubit(
    this._getUserDataUseCase,
    this._saveUserRoleUseCase,
    this._saveUserEmailUseCase,
  ) : super(LoginState.initial());
  final emailTextController = TextEditingController();
  final passwordTextControlle = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool obscuretext = true;
  bool isStudent = true;

  void changeObscureText() {
    emit(LoginState.initial());
    obscuretext = !obscuretext;
    emit(LoginState.updateUI());
  }

  void changeRole(bool value) {
    emit(LoginState.initial());
    isStudent = value;
    emit(LoginState.updateUI());
  }

  Future<void> login() async {
    try {
      if (formKey.currentState!.validate()) {
        emit(LoginState.loading());
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailTextController.text,
          password: passwordTextControlle.text,
        );
      }
      final user = await getUserData();
      await saveUserData(user: user);
      emit(LoginState<UserRole>.success(user.userRole));
    } on FirebaseAuthException catch (e) {
      emit(LoginState.failure(errMessage: e.code));
    } on UnFoundUser catch (_) {
      emit(LoginState<UnFoundUser>.failure(errMessage: ''));
    }
  }

  Future<UserModel> getUserData() async {
    final UserModel user = await _getUserDataUseCase.execute(
        isStudent: isStudent, email: emailTextController.text);
    await _saveUserRoleUseCase.execute(userRole: user.userRole);
    return user;
  }

  Future<void> saveUserData({required UserModel user}) async {
    await _saveUserRoleUseCase.execute(userRole: user.userRole);
    await _saveUserEmailUseCase.execute(email: user.email);
  }

  @override
  Future<void> close() async {
    emailTextController.dispose();
    passwordTextControlle.dispose();
    super.close();
  }
}
