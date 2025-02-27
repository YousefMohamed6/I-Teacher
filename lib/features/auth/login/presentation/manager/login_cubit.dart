import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/features/auth/login/presentation/manager/login_state.dart';

class LoginCubit extends Cubit<LoginViewState> {
  LoginCubit() : super(LoginInitial());
  var email = TextEditingController();
  var password = TextEditingController();
  var emailkey = GlobalKey<FormState>();
  var passwordKey = GlobalKey<FormState>();
  bool obscuretext = true;

  void changeObscureText() {
    obscuretext = !obscuretext;
    emit(LoginInitial());
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
      emit(LoginFailure(errMessage: e.code));
    }
  }
}
