import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mrjoo/core/utils/constants/firebase_keys.dart';
import 'package:mrjoo/features/chat/data/model/message_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(Initial());
  final messageCtrl = TextEditingController();
  final scrollController = ScrollController();
  final formKey = GlobalKey<FormState>();
  final CollectionReference reference =
      FirebaseFirestore.instance.collection(ChatKeys.kChatCollection);

  void sendMessage() async {
    var newMessage = MessageModel(
      content: messageCtrl.text,
      createdAt: DateTime.now().toString(),
      userId: FirebaseAuth.instance.currentUser?.uid ?? '',
      displayName: FirebaseAuth.instance.currentUser?.displayName ?? '',
    );
    animateToLastMessage();
    await addMessageToFirebase(message: newMessage);
    emit(Initial());
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    emit(SignOut());
  }

  void animateToLastMessage() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
    );
  }

  Future<void> addMessageToFirebase({required MessageModel message}) async {
    var createdAt = DateTime.parse(message.createdAt);
    await reference.add({
      ChatKeys.kContentField: message.content,
      ChatKeys.kCreatedAtField: createdAt,
      ChatKeys.kUesrIdField: FirebaseAuth.instance.currentUser!.uid,
      ChatKeys.kDisplayNameField:
          FirebaseAuth.instance.currentUser!.displayName,
    });
  }

  void fetchFirebaseMessages() {
    List<MessageModel> messages = [];
    reference
        .orderBy(
          ChatKeys.kCreatedAtField,
          descending: true,
        )
        .snapshots()
        .listen((event) async {
      messages.clear();
      for (int i = 0; i < event.docs.length; ++i) {
        messages.add(MessageModel.fromJsonData(event.docs[i]));
      }
      emit(Initial());
    });
  }
}
