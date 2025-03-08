import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());
  final emailTextController = TextEditingController();
  final passwordTextControlle = TextEditingController();
  final emailkey = GlobalKey<FormState>();
  final passwordKey = GlobalKey<FormState>();
  bool obscuretext = true;

  void changeObscureText() {
    emit(LoginState.initial());
    obscuretext = !obscuretext;
    emit(LoginState.updateUI());
  }

  Future<void> login() async {
    try {
      if (emailkey.currentState!.validate() &&
          passwordKey.currentState!.validate()) {
        emit(LoginState.loading());
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailTextController.text,
          password: passwordTextControlle.text,
        );
        emit(LoginState<bool>.success(true));
      }
    } on FirebaseAuthException catch (e) {
      emit(LoginState.failure(errMessage: e.code));
    }
  }
}
