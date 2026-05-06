import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_cubit.freezed.dart';
part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordState.initial());
  final emailTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> resetPassword() async {
    try {
      emit(ResetPasswordState.loading());
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailTextController.text);
      emit(ResetPasswordState.success());
    } on FirebaseAuthException catch (e) {
      emit(ResetPasswordState.failure(e.code));
    }
  }
}
