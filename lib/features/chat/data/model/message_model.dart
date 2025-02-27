import 'package:mrjoo/core/utils/constants/keys.dart';


class MessageModel  {
  final String content;
  final String createdAt;
  final String uId;
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
