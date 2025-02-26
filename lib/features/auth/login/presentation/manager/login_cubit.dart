import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:mrjoo/core/utils/constants/keys.dart';
import 'package:mrjoo/features/auth/login/presentation/manager/login_state.dart';
import 'package:mrjoo/features/chat/data/model/user_model.dart';

class LoginViewCubit extends Cubit<LoginViewState> {
  LoginViewCubit() : super(LoginInitial());
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
      await addUserToLocalStorage(loginEmail: email.text);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(errMessage: e.code));
    }
  }

  Future<void> addUserToLocalStorage({required String loginEmail}) async {
    var userBox = Hive.box<UserModel>(AppKeys.kUserBox);

    var user = UserModel(
      userId: FirebaseAuth.instance.currentUser!.uid,
      userName: FirebaseAuth.instance.currentUser!.displayName!,
      isAdmin: AppKeys.kAdminEmail == loginEmail ? true : false,
    );
    await userBox.add(user);
  }
}
