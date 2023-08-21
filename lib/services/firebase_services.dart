import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mrjoo/screens/chat_page.dart';
import 'package:mrjoo/screens/login_page.dart';

class FireBaseServices {
  static void chechIsLogin(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      Navigator.pushNamed(context, LoginPage.id);
    } else {
      Navigator.pushNamed(context, ChatPage.id);
    }
  }
}
