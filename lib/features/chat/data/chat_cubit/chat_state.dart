import 'package:mrjoo/features/chat/data/model/local_message.dart';

abstract class ChatState {}

 class Initial extends ChatState {
 }
class Failure extends ChatState {}
class Success extends ChatState {
  final List<LocalMessageModel> messages;
  Success({required this.messages});
}

class SignOut extends ChatState {}
