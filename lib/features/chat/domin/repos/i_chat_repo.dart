import 'package:iteacher/features/chat/data/models/message_model/message_model.dart';
import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';

abstract class IChatRepo {
  Future<List<TeacherModel>> getAllTeachers();
  Future<void> sendMessage(MessageModel message);
}
