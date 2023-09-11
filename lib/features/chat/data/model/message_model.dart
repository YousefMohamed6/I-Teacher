import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mrjoo/core/utils/constants/text.dart';

class MessageModel {
  final String message;
  final Timestamp createdAt;
  final String uId;
  final String displayName;
  MessageModel({
    required this.message,
    required this.createdAt,
    required this.uId,
    required this.displayName,
  });

  factory MessageModel.fromJsonData(dynamic jsonData) {
    return MessageModel(
      message: jsonData[kMessageField],
      createdAt: jsonData[kCreatedAtField],
      uId: jsonData[kUesrIdField],
      displayName: jsonData[kDisplayNameField],
    );
  }
}
