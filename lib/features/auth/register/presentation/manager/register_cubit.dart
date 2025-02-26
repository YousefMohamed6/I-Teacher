import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:mrjoo/core/utils/constants/text.dart';
import 'package:mrjoo/core/utils/helper.dart';
import 'package:mrjoo/core/utils/show_message.dart';
import 'package:mrjoo/features/auth/register/presentation/manager/register_state.dart';
import 'package:mrjoo/features/chat/data/model/user_model.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  var formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();
  var displyName = TextEditingController();
  bool _obscuretext = true;
  final bool _isLoading = false;
  String language = 'en';
  bool isAccept = true;

  void changeAccpetTremsAndPrivacy() {
    isAccept = !isAccept;
    emit(RegisterInitial());
  }

  void changeLanguage({required String language}) {
    this.language = language;
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
        plateform() ? _signInWithGoogleMobile() : _signInWithGoogleWeb();
      } on Exception {
        emit(Failure());
      }
    } else {
      ShowMessage.show(context, msg: 'Please Accept Trems & Policy');
    }
  }

  bool get obscuretext => _obscuretext;
  bool get isLoading => _isLoading;

  void register() async {
    if (isAccept) {
      emit(Loading());
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        FirebaseAuth.instance.currentUser!.updateDisplayName(displyName.text);
        await addUserToLocalStorage(loginEmail: email.text);
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
      await addUserToLocalStorage(
          loginEmail: FirebaseAuth.instance.currentUser!.email!);
      emit(Success());
    } catch (ex) {
      emit(Failure());
    }
  }

  Future<void> addUserToLocalStorage({required String loginEmail}) async {
    var userBox = Hive.box<UserModel>(kUserBox);

    var user = UserModel(
      userId: FirebaseAuth.instance.currentUser!.uid,
      userName: displyName.text,
      isAdmin: kAdminEmail == loginEmail ? true : false,
    );
    await userBox.add(user);
  }
}
