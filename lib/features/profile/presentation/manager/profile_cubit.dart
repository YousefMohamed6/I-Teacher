import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/features/profile/presentation/manager/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  void chechLoginState() {
    if (FirebaseAuth.instance.currentUser != null) {
      emit(UserLogin());
    } else {
      emit(UserLogout());
    }
    emit(ProfileInitial());
  }
}
