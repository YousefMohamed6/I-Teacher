import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mrjoo/core/utils/constants/text.dart';
import 'package:mrjoo/features/chat/data/chat_cubit/chat_state.dart';
import 'package:mrjoo/features/chat/data/model/local_message.dart';
import 'package:mrjoo/features/chat/data/model/message_model.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(Initial());
  final messageCtrl = TextEditingController();
  final scrollController = ScrollController();
  var formKey = GlobalKey<FormState>();

  CollectionReference reference =
      FirebaseFirestore.instance.collection(kMessageCollection);

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
    });
  }

  void fetchFirebaseMessage() {
    var localMessage = Hive.box<LocalMessageModel>(kMessageBox);
    reference
        .orderBy(kCreatedAtField, descending: true)
        .snapshots()
        .listen((event) async {
      await localMessage.add(
        LocalMessageModel.fromJsonData(event.docs.last),
      );
    });
  }

  void fetchlocalMessage() async {
    var localMessage = Hive.box<LocalMessageModel>(kMessageBox);
    emit(Success(messages: localMessage.values.toList()));
  }

  Future<void> sendMessageToFirebase(
      {required LocalMessageModel message}) async {
    var createdAt = DateTime.parse(message.createdAt);
    await reference.add({
      kMessageField: message.content,
      kCreatedAtField: createdAt,
      kUesrIdField: FirebaseAuth.instance.currentUser!.uid,
      kDisplayNameField: FirebaseAuth.instance.currentUser!.displayName,
    });
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    emit(SignOut());
  }

  void addMessageToLocalStorge() async {
    try {
      var localMessage = Hive.box<LocalMessageModel>(kMessageBox);
      var message = LocalMessageModel(
          content: messageCtrl.text,
          createdAt: DateTime.now().toString(),
          uId: FirebaseAuth.instance.currentUser?.uid ?? "whwyywyukwjwogtvhiw",
          fullName:
              FirebaseAuth.instance.currentUser?.displayName ?? 'New User');
      await localMessage.add(message);
      messageCtrl.clear();
      fetchlocalMessage();
      await sendMessageToFirebase(message: message);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
