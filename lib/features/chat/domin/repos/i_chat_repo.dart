import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

abstract class IChatRepo {
  Future<List<types.Message>> getAllMessages();
  Future<void> sendMessage(types.Message message);
}
