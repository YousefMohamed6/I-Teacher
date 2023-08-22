import 'package:mrjoo/models/message_model.dart';

abstract class ChatState {}

class Loading extends ChatState {}

class Success extends ChatState {
  final List<MessageModel> messages;

  Success({required this.messages});
}

class SignOut extends ChatState {}
