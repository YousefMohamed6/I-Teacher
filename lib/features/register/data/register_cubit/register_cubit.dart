import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mrjoo/features/register/data/register_cubit/register_state.dart';
import 'package:mrjoo/core/utils/helper.dart';

class RegisterViewCubit extends Cubit<RegisterViewState> {
  RegisterViewCubit() : super(RegisterInitial());
  var formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();
  var displyName = TextEditingController();
  bool _obscuretext = true;
  final bool _isLoading = false;

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

  Future<void> singInWithGoogle() async {
    emit(Loading());
    try {
      plateform() ? _signInWithGoogleMobile() : _signInWithGoogleWeb();
    } on Exception {
      emit(Failure());
    }
  }

  bool get obscuretext => _obscuretext;
  bool get isLoading => _isLoading;

  void register() async {
    emit(Loading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      FirebaseAuth.instance.currentUser!.updateDisplayName(displyName.text);
      emit(Success());
    } on FirebaseAuthException catch (ex) {
      emit(RegisterFailure(errMessage: ex.code));
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
