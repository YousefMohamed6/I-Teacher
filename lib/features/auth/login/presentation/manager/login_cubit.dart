import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginViewState> {
  LoginCubit() : super(LoginInitial());
  final emailTextController = TextEditingController();
  final passwordTextControlle = TextEditingController();
  final emailkey = GlobalKey<FormState>();
  final passwordKey = GlobalKey<FormState>();
  bool obscuretext = true;

  void changeObscureText() {
    obscuretext = !obscuretext;
    emit(LoginInitial());
  }

  void loginUser() async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextControlle.text,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(errMessage: e.code));
    }
  }
}
