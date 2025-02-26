part of 'chat_cubit.dart';



sealed class ChatState {}

class Initial extends ChatState {}

class Failure extends ChatState {}

class Success extends ChatState {
  final List<MessageModel> messages;

  Success({required this.messages});
}

class SignOut extends ChatState {}
