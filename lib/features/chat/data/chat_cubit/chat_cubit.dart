import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mrjoo/core/utils/constants/text.dart';
import 'package:mrjoo/features/chat/data/chat_cubit/chat_state.dart';
import 'package:mrjoo/features/chat/data/model/message_model.dart';
import 'package:mrjoo/features/chat/data/model/user_model.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(Initial());
  final messageCtrl = TextEditingController();
  final scrollController = ScrollController();
  var formKey = GlobalKey<FormState>();
  List<MessageModel> messages = [];
  CollectionReference reference =
      FirebaseFirestore.instance.collection(kMessageCollection);
  var messageBox = Hive.box<MessageModel>(kMessageBox);

  void sendMessage() async {
    messageBox.clear();
    var userBox = Hive.box<UserModel>(kUserBox);
    var user = userBox.values.first;
    var newMessage = MessageModel(
      content: messageCtrl.text,
      createdAt: DateTime.now().toString(),
      uId: FirebaseAuth.instance.currentUser?.uid ?? user.userId,
      fullName: FirebaseAuth.instance.currentUser?.displayName ?? user.userName,
    );
    sendMessageToMemory(message: newMessage);
    animateToLastMessage();
    await sendMessageToFirebase(message: newMessage);
    fetchFirebaseMessages();
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

  void animateToLastMessage() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
    );
  }

  void sendMessageToMemory({required MessageModel message}) async {
    try {
      await messageBox.add(message);
      messageCtrl.clear();
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> sendMessageToFirebase({required MessageModel message}) async {
    var createdAt = DateTime.parse(message.createdAt);
    await reference.add({
      kMessageField: message.content,
      kCreatedAtField: createdAt,
      kUesrIdField: FirebaseAuth.instance.currentUser!.uid,
      kDisplayNameField: FirebaseAuth.instance.currentUser!.displayName,
    });
  }

  void fetchFirebaseMessages() {
    reference
        .orderBy(kCreatedAtField, descending: true)
        .snapshots()
        .listen((event) async {
      messages.clear();
      await messageBox.clear();
      for (int i = 0; i < event.docs.length; ++i) {
        messages.add(MessageModel.fromJsonData(event.docs[i]));
      }
      await messageBox.addAll(messages);
      emit(Initial());
    });
  }
}
