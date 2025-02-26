import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mrjoo/core/utils/constants/keys.dart';
import 'package:mrjoo/features/chat/data/model/user_model.dart';
import 'package:mrjoo/features/course/presentation/widgets/update_url_view.dart';

part 'course_view_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());
  final TextEditingController courseCtrl = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CollectionReference reference =
      FirebaseFirestore.instance.collection(AppKeys.kCorseCollection);
  String url = 'https://';
  UserModel getLocalUser() {
    var userBox = Hive.box<UserModel>(AppKeys.kUserBox);
    var user = userBox.values.first;
    return user;
  }

  void setState() {
    emit(CourseInitial());
  }

  Future<void> updateUrl() async {
    try {
      await reference
          .doc('Tbxwjacp22K3BPDaTMT8')
          .update({'url': courseCtrl.text});
      emit(UpdateSucees());
    } catch (e) {
      emit(UpdateFailure());
    }
  }

  Future<void> fetchUrl() async {
    emit(Loading());
    reference.snapshots().listen((event) async {
      String url = await event.docs[0]['url'];
      if (this.url != url) {
        this.url = url;
        emit(Success(url: url));
      }
    });
  }

  void showBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      context: context,
      builder: (context) => const UpdateUrlView(),
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    var userBox = Hive.box<UserModel>(AppKeys.kUserBox);
    userBox.clear();
    emit(SignOut());
  }
}
