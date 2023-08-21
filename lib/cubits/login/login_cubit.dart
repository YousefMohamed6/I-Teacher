import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mrjoo/cubits/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginPageState> {
  LoginCubit() : super(HidenPassword());
  var email = TextEditingController();
  var password = TextEditingController();
  var emailkey = GlobalKey<FormState>();
  var passwordKey = GlobalKey<FormState>();
  bool obscuretext = true;
 

  void changeObscureText() {
    obscuretext = !obscuretext;
    obscuretext ? emit(HidenPassword()) : emit(ShowPassword());
  }

  void loginUser() async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      emit(LoginFialure(errMessage: e.code));
    }
  }

  Future<void> restPassword() async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email.text,
      );
      emit(RestSuccess());
    } on Exception {
      emit(LoginFialure(errMessage: 'Invalid Email'));
    }
  }
}
