import 'package:iteacher/core/utils/constants/firebase_keys.dart';
import 'package:iteacher/features/chat/data/models/message_model/message_model.dart';

class TextMessageModel implements MessageModel {
  final String text;
  @override
  final String senderId;
  @override
  final String createdAt;
  @override
  final String reciverId;

  TextMessageModel({
    required this.text,
    required this.senderId,
    required this.createdAt,
    required this.reciverId,
  });
  factory TextMessageModel.fromJson(Map<String, dynamic> json) {
    return TextMessageModel(
      text: json['text'],
      senderId: ChatKeys.kSenderField,
      createdAt: json['createdAt'],
      reciverId: json[ChatKeys.kReciverField],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      ChatKeys.kSenderField: senderId,
      'createdAt': createdAt,
      'type': type,
      ChatKeys.kReciverField: reciverId
    };
  }

  @override
  String get type => 'text';
}
