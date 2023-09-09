import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/features/home/data/home_cubit/home_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit() : super(HomeViewInitial());
  void chechIsLogin() {
    if (FirebaseAuth.instance.currentUser != null) {
      emit(UserLogin());
    } else {
      emit(UserLogout());
    }
    emit(HomeViewInitial());
  }
}
