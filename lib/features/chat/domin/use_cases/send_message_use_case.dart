import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:mrjoo/features/chat/domin/repos/i_chat_repo.dart';

class SendMessageUseCase {
  final IChatRepo _chatRepo;

  SendMessageUseCase(this._chatRepo);

  Future<void> execute(types.Message message) async {
    return _chatRepo.sendMessage(message);
  }
}
