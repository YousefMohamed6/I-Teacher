import 'package:mrjoo/core/services/firebase_auth_service.dart';

class CreateUserWithEmailAndPasswordUseCase {
  final FirebaseAuthService firebaseAuthService;
  CreateUserWithEmailAndPasswordUseCase(this.firebaseAuthService);
  Future<void> execute({
    required String email,
    required String password,
    String? displyName,
  }) async {
    await firebaseAuthService.createUserWithEmailAndPassword(
      email: email,
      password: password,
      displyName: displyName,
    );
  }
}
