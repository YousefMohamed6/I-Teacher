import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mrjoo/helper/helper.dart';
import 'package:mrjoo/helper/show_message.dart';
import 'package:mrjoo/screens/chat_page.dart';
import 'package:mrjoo/screens/login_page.dart';

class GoogleServices {
  Future<void> restPassword(context, {required email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email.text,
      );
      ShowMessage.show(context, msg: 'Open Gmail to Rest Password');
    } on Exception {
      ShowMessage.show(context, msg: 'Invalid Email');
    }
  }

  static Future<void> signOut(context) async {
    await FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    ShowMessage.show(context, msg: 'Log Out');
    Navigator.popAndPushNamed(context, LoginPage.id);
  }

  static Future<void> signInWithGoogle(context) async {
    plateform()
        ? await _signInWithGoogleMobile(context)
        : await _signInWithGoogleWeb(context);
  }

  static Future<void> _signInWithGoogleMobile(context) async {
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
      Navigator.popAndPushNamed(context, ChatPage.id);
    } catch (ex) {
      ShowMessage.show(context, msg: 'Failed');
    }
  }

  static Future<void> _signInWithGoogleWeb(context) async {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      googleProvider
          .addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
      await FirebaseAuth.instance.signInWithPopup(googleProvider);

      Navigator.popAndPushNamed(context, ChatPage.id);
    } catch (ex) {
      ShowMessage.show(context, msg: 'Failed');
    }
  }
}
