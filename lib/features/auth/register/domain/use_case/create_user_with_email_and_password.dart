import 'package:iteacher/core/services/firebase_auth_service.dart';

class CreateUserWithEmailAndPasswordUseCase {
  final FirebaseAuthService firebaseAuthService;
  CreateUserWithEmailAndPasswordUseCase(this.firebaseAuthService);
  Future<void> execute({
    required String email,
    required String password,
    String? displayName,
  }) async {
    await firebaseAuthService.signUp(
      email: email,
      password: password,
      displayName: displayName,
    );
  }
}
