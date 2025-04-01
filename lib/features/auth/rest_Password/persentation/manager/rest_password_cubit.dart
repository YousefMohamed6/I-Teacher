import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_password_cubit.freezed.dart';
part 'rest_password_state.dart';

class RestPasswordCubit extends Cubit<RestPasswordState> {
  RestPasswordCubit() : super(RestPasswordState.initial());
  final emailTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> restPassword() async {
    try {
      emit(RestPasswordState.loading());
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailTextController.text);
      emit(RestPasswordState.success());
    } on FirebaseAuthException catch (e) {
      emit(RestPasswordState.failure(e.code));
    }
  }
}
