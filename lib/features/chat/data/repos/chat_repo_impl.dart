import 'package:mrjoo/core/services/firebase_firestore_service.dart';
import 'package:mrjoo/core/utils/constants/firebase_keys.dart';
import 'package:mrjoo/features/chat/data/models/message_model/message_model.dart';
import 'package:mrjoo/features/chat/domin/repos/i_chat_repo.dart';

class ChatRepoImpl implements IChatRepo {
  final FirebaseFirestoreService _firebaseFirestoreService;
  ChatRepoImpl(this._firebaseFirestoreService);
  @override
  Future<List<MessageModel>> getAllMessages() async {
    final response = await _firebaseFirestoreService.getCollection(
      collectionId: ChatKeys.kChatCollection,
      orderByField: ChatKeys.kCreatedAtField,
      descending: true,
    );
    return response
        .map((e) => MessageModel.fromJson(e.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> sendMessage(MessageModel message) {
    return _firebaseFirestoreService.addDocument(
      collectionId: ChatKeys.kChatCollection,
      data: message.toJson(),
    );
  }
}
