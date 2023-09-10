import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mrjoo/core/utils/constants/text.dart';
import 'package:mrjoo/features/chat/data/chat_cubit/chat_state.dart';
import 'package:mrjoo/features/chat/data/model/message_model.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(Loading());
  final messageCtrl = TextEditingController();
  final scrollController = ScrollController();
  var formKey = GlobalKey<FormState>();

  CollectionReference reference =
      FirebaseFirestore.instance.collection(kMessageCollection);
  Stream<QuerySnapshot<Object?>>? snapshot;


  void animateTo() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
    );
  }

  void fetchMessages() {
    reference
        .orderBy(kCreatedAtField, descending: true)
        .snapshots()
        .listen((event) {
      List<MessageModel> messages = [];
      for (int i = 0; i < event.docs.length; ++i) {
        messages.add(MessageModel.fromJsonData(event.docs[i]));
      }
      emit(Success(messages: messages));
    });
  }

  void sendMessage({String? message}) async {
    if (formKey.currentState!.validate()) {
      await reference.add({
        kMessageField: messageCtrl.text,
        kCreatedAtField: DateTime.now(),
        kUesrIdField: FirebaseAuth.instance.currentUser!.uid,
        kDisplayNameField: FirebaseAuth.instance.currentUser!.displayName,
      });
      fetchMessages();
      animateTo();
      messageCtrl.clear();
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    emit(SignOut());
  }
}
