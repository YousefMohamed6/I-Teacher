import 'package:mrjoo/features/chat/data/models/message_model/message_model.dart';

abstract class IChatRepo {
  Future<List<MessageModel>> getAllMessages();
  Future<void> sendMessage(MessageModel message);
}
