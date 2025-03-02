import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mrjoo/core/exceptions/not_accept_terms.dart';
import 'package:mrjoo/features/auth/register/domain/use_case/create_user_with_email_and_password.dart';
import 'package:mrjoo/features/auth/register/domain/use_case/sign_in_use_google.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final SignInUseGoogleUseCase _signInUseGoogle;
  final CreateUserWithEmailAndPasswordUseCase _createUserWithEmailAndPassword;
  RegisterCubit(
    this._signInUseGoogle,
    this._createUserWithEmailAndPassword,
  ) : super(RegisterState.initial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController displayNameTextController =
      TextEditingController();
  bool _obscuretext = true;
  bool isAccept = true;
  bool get obscuretext => _obscuretext;
  void changeAccpetTermsAndPrivacy() {
    isAccept = !isAccept;
    setState();
  }

  void changeObscureText() {
    _obscuretext = !_obscuretext;
    setState();
  }

  void setState() {
    emit(RegisterState.initial());
    emit(RegisterState.updateUI());
  }

  Future<void> singInWithGoogle() async {
    try {
      emit(RegisterState<bool>.loading());
      if (isAccept) {
        await _signInUseGoogle.execute();
        emit(RegisterState<bool>.success(true));
      } else {
        throw NotAcceptTermsException();
      }
    } on NotAcceptTermsException catch (e) {
      emit(RegisterState<NotAcceptTermsException>.failure(e.toString()));
    } catch (e) {
      emit(RegisterState<String>.failure(e.toString()));
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      emit(RegisterState.loading());
      if (isAccept) {
        await _createUserWithEmailAndPassword.execute(
          email: emailTextController.text,
          password: passwordTextController.text,
          displyName: displayNameTextController.text,
        );
        emit(RegisterState<bool>.success(true));
      } else {
        throw NotAcceptTermsException();
      }
    } on FirebaseAuthException catch (e) {
      emit(RegisterState.failure(e.code));
    } on NotAcceptTermsException catch (e) {
      emit(RegisterState<NotAcceptTermsException>.failure(e.toString()));
    }
  }
}
