import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/consts/text.dart';
import 'package:mrjoo/cubits/chat/chat_state.dart';
import 'package:mrjoo/helper/show_message.dart';
import 'package:mrjoo/models/message_model.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatSuccess());
  final messageCtrl = TextEditingController();
  final scrollController = ScrollController();
  var formKey = GlobalKey<FormState>();
  String? _minute;
  String? _hour;
  String? _timeState;
  CollectionReference reference =
      FirebaseFirestore.instance.collection(kMessageCollection);
  List<MessageModel> messages = [];
  void sentMessage() {
    reference.add({
      kMessageField: messageCtrl.text,
      kCreatedAtField: DateTime.now(),
      kUesrIdField: FirebaseAuth.instance.currentUser!.uid,
      kDisplayNameField: FirebaseAuth.instance.currentUser!.displayName,
    });
    emit(ChatSuccess());
    animateTo();
  }

  String get hour {
    var value = 12;
    if (value == 24) {
      _hour = '12';
      _timeState = 'Am';
      return _hour!;
    } else if (value > 12) {
      _hour = (value - 12).toString();
      _timeState = 'Pm';
      return _hour!;
    } else {
      _timeState = 'Am';
      return _hour!;
    }
  }

  String get minute {
    return _minute!;
  }

  String get timeState {
    return _timeState!;
  }

  void animateTo() {
    scrollController.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  void getMesssages(context) async {
    emit(ChatLoading());
    try {
      QuerySnapshot<Object?> collection = await reference.get();
      var date = collection.docs;
      for (int i = 0; i < date.length; ++i) {
        messages.add(MessageModel.fromJsonData(date[i]));
      }
      animateTo();
      emit(ChatSuccess());
    } catch (e) {
      ShowMessage.show(context, msg: 'Failed get Messages');
      emit(ChatFailure());
    }
  }

  void checkValidate() {
    if (formKey.currentState!.validate()) {
      sentMessage();
      animateTo();
      messageCtrl.clear();
    }
  }
}
