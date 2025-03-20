import 'package:mrjoo/features/chat/data/models/message_model/message_model.dart';
import 'package:mrjoo/features/profile/data/model/teacher_model.dart';

abstract class IChatRepo {
  Future<List<TeacherModel>> getAllTeachers();
  Future<void> sendMessage(MessageModel message);
}
