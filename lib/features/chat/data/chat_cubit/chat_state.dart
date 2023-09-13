import 'package:mrjoo/features/chat/data/model/message_model.dart';

abstract class ChatState {}

class Initial extends ChatState {}

class Failure extends ChatState {}

class Success extends ChatState {
  final List<MessageModel> messages;

  Success({required this.messages});
}

class SignOut extends ChatState {}
