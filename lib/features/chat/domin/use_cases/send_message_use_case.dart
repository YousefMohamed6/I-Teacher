import 'package:mrjoo/features/chat/data/models/message_model/message_model.dart';
import 'package:mrjoo/features/chat/domin/repos/i_chat_repo.dart';

class SendMessageUseCase {
  final IChatRepo _chatRepo;

  SendMessageUseCase(this._chatRepo);

  Future<void> execute(MessageModel message) async {
    return _chatRepo.sendMessage(message);
  }
}
