import 'dart:io';

import 'package:mrjoo/core/services/firebase_auth_service.dart';

class SignInUseGoogleUseCase {
  final FirebaseAuthService firebaseAuthService;
  SignInUseGoogleUseCase(this.firebaseAuthService);

  Future<void> execute() async {
    if (Platform.isAndroid || Platform.isIOS) {
      await firebaseAuthService.signInWithGoogleMobile();
    } else {
      await firebaseAuthService.signInWithGoogleWeb();
    }
  }
}
