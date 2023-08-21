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
  bool isLoading = false;

  void changeObscureText() {
    obscuretext = !obscuretext;
    obscuretext ? emit(HidenPassword()) : emit(ShowPassword());
  }

<<<<<<< HEAD
  void loginUser() async {
    emit(LoginLoading());
=======
  void changeStateLoading() {
    _isLoading = !_isLoading;
    _isLoading ? emit(LoadingState()) : emit(InitialState());
  }

  bool get obscuretext => _obscuretext;
  bool get isLoading => _isLoading;

  void loginUser(context) async {
>>>>>>> b2db2189bd5d52409229ac81e9bf8c27e25b0840
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
