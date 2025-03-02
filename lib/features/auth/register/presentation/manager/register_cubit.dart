import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mrjoo/features/auth/register/presentation/manager/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController displyNameTextController =
      TextEditingController();
  bool _obscuretext = true;
  bool isAccept = true;
  bool get obscuretext => _obscuretext;
  void changeAccpetTremsAndPrivacy() {
    isAccept = !isAccept;
    emit(RegisterInitial());
  }

  void changeObscureText() {
    _obscuretext = !_obscuretext;
    emit(RegisterInitial());
  }

  Future<void> _signInWithGoogleMobile() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      await GoogleSignIn().signOut();
      emit(Success());
    } catch (ex) {
      emit(Failure());
    }
  }

  Future<void> singInWithGoogle(context) async {
    if (isAccept) {
      try {
        emit(Loading());
        Platform.isAndroid || Platform.isIOS
            ? _signInWithGoogleMobile()
            : _signInWithGoogleWeb();
      } on Exception {
        emit(Failure());
      }
    } else {
      throw Exception("");
    }
  }

  void register() async {
    if (isAccept) {
      emit(Loading());
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextController.text,
          password: passwordTextController.text,
        );
        FirebaseAuth.instance.currentUser!
            .updateDisplayName(displyNameTextController.text);
        emit(Success());
      } on FirebaseAuthException catch (ex) {
        emit(RegisterFailure(errMessage: ex.code));
      }
    } else {
      emit(NotAcceptTermsAndPolicy());
    }
  }

  Future<void> _signInWithGoogleWeb() async {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      googleProvider
          .addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
      await FirebaseAuth.instance.signInWithPopup(googleProvider);
      emit(Success());
    } catch (ex) {
      emit(Failure());
    }
  }
}
