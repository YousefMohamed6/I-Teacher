import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rest_password_state.dart';

class RestPasswordCubit extends Cubit<RestPasswordState> {
  RestPasswordCubit() : super(RestPasswordInitial());
  final email = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> restPassword() async {
    emit(RestPasswordLoading());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      emit(RestPasswordSucess());
    } on FirebaseAuthException catch (e) {
      emit(RestPasswordFailure(errorMessage: e.code));
    }
  }
}
