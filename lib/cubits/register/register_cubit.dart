import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/cubits/register/register_state.dart';
import 'package:mrjoo/helper/show_message.dart';
import 'package:mrjoo/screens/chat_page.dart';

class RegisterCubit extends Cubit<RegisterPageState> {
  RegisterCubit() : super(HidenPassword());
  var formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();
  var displyName = TextEditingController();
  bool _obscuretext = true;
  bool _isLoading = false;

  void changeObscureText() {
    _obscuretext = !_obscuretext;
    _obscuretext ? emit(HidenPassword()) : emit(ShowPassword());
  }

  void changeStateLoading() {
    _isLoading = !_isLoading;
    _isLoading ? emit(LoadingState()) : emit(InitState());
  }

  bool get obscuretext => _obscuretext;
  bool get isLoading => _isLoading;

  void register(context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      FirebaseAuth.instance.currentUser!.updateDisplayName(displyName.text);
      ShowMessage.show(context, msg: 'Success');
      Navigator.popAndPushNamed(context, ChatPage.id);
    } on FirebaseAuthException catch (e) {
      ShowMessage.show(context, msg: e.code);
    }
  }
}
