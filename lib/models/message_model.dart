import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mrjoo/consts/text.dart';

class MessageModel {
  final String message;
  final Timestamp time;
  final String id;
  final String displayName;
  MessageModel({
    required this.message,
    required this.time,
    required this.id,
    required this.displayName,
  });

  factory MessageModel.fromJsonData(dynamic jsonData) {
    return MessageModel(
      message: jsonData[kMessageField],
      time: jsonData[kCreatedAtField],
      id: jsonData[kUesrIdField],
      displayName: jsonData[kDisplayNameField],
    );
  }
}
