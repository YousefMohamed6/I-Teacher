import 'package:hive/hive.dart';
import 'package:mrjoo/core/utils/constants/text.dart';
part 'local_message.g.dart';

@HiveType(typeId: 0)
class LocalMessageModel extends HiveObject {
  @HiveField(0)
  final String content;
  @HiveField(1)
  final String createdAt;
  @HiveField(2)
  final String uId;
  @HiveField(3)
  final String fullName;

  LocalMessageModel({
    required this.content,
    required this.createdAt,
    required this.uId,
    required this.fullName,
  });
  factory LocalMessageModel.fromJsonData(dynamic jsonData) {
    return LocalMessageModel(
      content: jsonData[kMessageField],
      createdAt: jsonData[kCreatedAtField],
      uId: jsonData[kUesrIdField],
      fullName: jsonData[kDisplayNameField],
    );
  }
}
