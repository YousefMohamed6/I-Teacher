import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mrjoo/core/utils/constants/text.dart';
import 'package:mrjoo/features/chat/data/model/user_model.dart';
import 'package:mrjoo/features/course/presentation/widgets/update_url_view.dart';

part 'course_view_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());
  final TextEditingController courseCtrl = TextEditingController();
  String url = 'https://www.google.com';

  CollectionReference reference =
      FirebaseFirestore.instance.collection(kCorseCollection);

  UserModel getLocalUser() {
    var userBox = Hive.box<UserModel>(kUserBox);
    var user = userBox.values.first;
    return user;
  }

  Future<void> updateUrl() async {
    await reference.doc('corseUrl').update({'url': courseCtrl.text});
  }

  Future<void> getUrl() async {
    reference.snapshots().listen((event) {
      url = event.docs[0]['url'] as String;
      emit(CourseInitial());
    });
  }

  void showBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      context: context,
      builder: (context) => const UpdateUrlView(),
    );
    emit(CourseInitial());
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    var userBox = Hive.box<UserModel>(kUserBox);
    if (userBox.values.firstOrNull != null) {
      var user = userBox.values.first;
      user.delete();
    }
    emit(SignOut());
  }
}
