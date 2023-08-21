import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/cubits/homepage/homepage_state.dart';

class HomepageCubit extends Cubit<HomePageState> {
  HomepageCubit() : super(HomepageInitial());
  void chechIsLogin() {
    if (FirebaseAuth.instance.currentUser != null) {
      emit(UserLogin());
    } else {
      emit(UserLogout());
    }
    emit(HomepageInitial());
  }
}
