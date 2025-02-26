import 'package:hive/hive.dart';
import 'package:mrjoo/core/utils/constants/keys.dart';

part 'message_model.g.dart';

@HiveType(typeId: 0)
class MessageModel extends HiveObject {
  @HiveField(0)
  final String content;
  @HiveField(1)
  final String createdAt;
  @HiveField(2)
  final String uId;
  @HiveField(3)
  final String fullName;

  MessageModel({
    required this.content,
    required this.createdAt,
    required this.uId,
    required this.fullName,
  });
  factory MessageModel.fromJsonData(dynamic jsonData) {
    return MessageModel(
      content: jsonData[AppKeys.kMessageField],
      createdAt: jsonData[AppKeys.kCreatedAtField].toDate().toString(),
      uId: jsonData[AppKeys.kUesrIdField],
      fullName: jsonData[AppKeys.kDisplayNameField],
    );
  }
}
