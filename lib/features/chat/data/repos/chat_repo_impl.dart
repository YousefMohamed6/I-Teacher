import 'package:iteacher/core/services/firebase_firestore_service.dart';
import 'package:iteacher/core/utils/constants/firebase_keys.dart';
import 'package:iteacher/features/chat/data/models/message_model/message_model.dart';
import 'package:iteacher/features/chat/domin/repos/i_chat_repo.dart';
import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';

class ChatRepoImpl implements IChatRepo {
  final FirebaseFirestoreService _firebaseFirestoreService;
  ChatRepoImpl(this._firebaseFirestoreService);
  @override
  Future<List<TeacherModel>> getAllTeachers() async {
    final response = await _firebaseFirestoreService.getCollection(
      collectionId: TeacherKeys.kTeachersCollection,
      orderByField: TeacherKeys.kfirstNameField,
    );
    return response.map((json) {
      final data = json.data() as Map<String, dynamic>;
      data.addAll({AccountsKeys.kAccountsCollection: []});
      return TeacherModel.fromJson(data);
    }).toList();
  }

  @override
  Future<void> sendMessage(MessageModel message) {
    return _firebaseFirestoreService.addDocument(
      collectionId: ChatKeys.kChatCollection,
      data: message.toJson(),
    );
  }
}
