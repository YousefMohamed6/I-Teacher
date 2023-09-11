import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mrjoo/core/utils/constants/text.dart';
import 'package:mrjoo/features/chat/data/chat_cubit/chat_state.dart';
import 'package:mrjoo/features/chat/data/model/message_model.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(Initial());
  final messageCtrl = TextEditingController();
  final scrollController = ScrollController();
  var formKey = GlobalKey<FormState>();
  List<MessageModel> messagesList = [];
  CollectionReference reference =
      FirebaseFirestore.instance.collection(kMessageCollection);

  void sendMessage() async {
    var message = MessageModel(
        content: messageCtrl.text,
        createdAt: DateTime.now().toString(),
        uId: FirebaseAuth.instance.currentUser?.uid ?? "whwyywyukwjwogtvhiw",
        fullName: FirebaseAuth.instance.currentUser?.displayName ?? 'New User');
    sendMessageToMemory(message: message);
    fetchlocalMessage();
    await sendMessageToFirebase(message: message);
    fetchFirebaseMessage();
    animateTo();
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    emit(SignOut());
  }

  void animateTo() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
    );
  }

  void fetchlocalMessage() async {
    var messageBox = Hive.box<MessageModel>(kMessageBox);
    messagesList.clear();
    var messages = messageBox.values.toList();
    emit(Success(messages: messages));
  }

  void sendMessageToMemory({required MessageModel message}) async {
    try {
      var messageBox = Hive.box<MessageModel>(kMessageBox);
      await messageBox.add(message);
      messageCtrl.clear();
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void fetchFirebaseMessage() {
    var messageBox = Hive.box<MessageModel>(kMessageBox);
    reference
        .orderBy(kCreatedAtField, descending: true)
        .snapshots()
        .listen((event) async {
      await messageBox.add(
        MessageModel.fromJsonData(event.docs.last.data()),
      );
    });
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
}
