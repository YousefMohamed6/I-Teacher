import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mrjoo/core/utils/constants/firebase_keys.dart';

class MessageModel {
  final String content;
  final String createdAt;
  final String userId;
  final String displayName;

  MessageModel({
    required this.content,
    required this.createdAt,
    required this.userId,
    required this.displayName,
  });
  factory MessageModel.fromJsonData(dynamic jsonData) {
    return MessageModel(
      content: jsonData[ChatKeys.kContentField],
      createdAt:
          (jsonData[ChatKeys.kCreatedAtField] as Timestamp).toDate().toString(),
      userId: jsonData[ChatKeys.kUesrIdField],
      displayName: jsonData[ChatKeys.kDisplayNameField],
    );
  }
}
