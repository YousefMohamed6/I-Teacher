import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:mrjoo/core/services/firebase_service.dart';
import 'package:mrjoo/core/utils/constants/firebase_keys.dart';
import 'package:mrjoo/features/chat/domin/repos/i_chat_repo.dart';

class ChatRepoImpl implements IChatRepo {
  final FirebaseFirestoreService _firebaseFirestoreService;
  ChatRepoImpl(this._firebaseFirestoreService);
  @override
  Future<List<types.Message>> getAllMessages() async {
    final response = await _firebaseFirestoreService.getCollection(
      collectionId: ChatKeys.kChatCollection,
    );
    return response
        .map((e) => types.Message.fromJson(e.data() as Map<String, dynamic>))
        .toList();
  }
  
  @override
  Future<void> sendMessage(types.Message message) {
    return _firebaseFirestoreService.addDocument(
      collectionId: ChatKeys.kChatCollection,
      data: message.toJson(),
    );
  }
}
