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
  String url = 'https://www.youtube.com';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CollectionReference reference =
      FirebaseFirestore.instance.collection(kCorseCollection);

  UserModel getLocalUser() {
    var userBox = Hive.box<UserModel>(kUserBox);
    var user = userBox.values.first;
    return user;
  }

  Future<void> updateUrl() async {
    try {
      reference.doc('Tbxwjacp22K3BPDaTMT8').update({'url': courseCtrl.text});
      emit(UpdateSucees());
    } catch (e) {
      emit(UpdateFailure());
    }
  }

  String fetchUrl() {
    reference.snapshots().listen((event) {
      url = event.docs[0]['url'] as String;
    });
    return url;
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
    var userBox = Hive.box<UserModel>(kUserBox);
    userBox.clear();
    emit(SignOut());
  }
}
