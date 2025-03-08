import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:mrjoo/features/chat/domin/repos/i_chat_repo.dart';

class ReadAllMessagesUseCase {
  final IChatRepo _chatRepo;

  ReadAllMessagesUseCase(this._chatRepo);

  Future<List<types.Message>> execute() async {
    return _chatRepo.getAllMessages();
  }
}
