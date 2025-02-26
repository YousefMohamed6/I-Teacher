import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mrjoo/core/utils/constants/keys.dart';
import 'package:mrjoo/features/chat/data/model/message_model.dart';
import 'package:mrjoo/features/chat/data/model/user_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(Initial());
  final messageCtrl = TextEditingController();
  final scrollController = ScrollController();
  var formKey = GlobalKey<FormState>();
  CollectionReference reference =
      FirebaseFirestore.instance.collection(AppKeys.kMessageCollection);
  var messageBox = Hive.box<MessageModel>(AppKeys.kMessageBox);

  void sendMessage() async {
    var userBox = Hive.box<UserModel>(AppKeys.kUserBox);
    var user = userBox.values.first;
    var newMessage = MessageModel(
      content: messageCtrl.text,
      createdAt: DateTime.now().toString(),
      uId: FirebaseAuth.instance.currentUser?.uid ?? user.userId,
      fullName: FirebaseAuth.instance.currentUser?.displayName ?? user.userName,
    );
    addMessageToLocalMemory(message: newMessage);
    animateToLastMessage();
    await addMessageToFirebase(message: newMessage);
    emit(Initial());
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    var userBox = Hive.box<UserModel>(AppKeys.kUserBox);
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

  void addMessageToLocalMemory({required MessageModel message}) async {
    try {
      await messageBox.add(message);
      messageCtrl.clear();
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> addMessageToFirebase({required MessageModel message}) async {
    var createdAt = DateTime.parse(message.createdAt);
    await reference.add({
      AppKeys.kMessageField: message.content,
      AppKeys.kCreatedAtField: createdAt,
      AppKeys.kUesrIdField: FirebaseAuth.instance.currentUser!.uid,
      AppKeys.kDisplayNameField: FirebaseAuth.instance.currentUser!.displayName,
    });
  }

  void fetchFirebaseMessages() {
    List<MessageModel> messages = [];
    reference
        .orderBy(AppKeys.kCreatedAtField, descending: true)
        .snapshots()
        .listen((event) async {
      await messageBox.clear();
      messages.clear();
      for (int i = 0; i < event.docs.length; ++i) {
        messages.add(MessageModel.fromJsonData(event.docs[i]));
      }
      await messageBox.addAll(messages);
      emit(Initial());
    });
  }

  void fetchLocalMessage() {
    List<MessageModel> messagesList = [];
    var messages = messageBox.values.toList();
    messagesList.addAll(messages);
    emit(Success(messages: messages));
  }
}
