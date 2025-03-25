import 'package:iteacher/core/utils/constants/firebase_keys.dart';
import 'package:iteacher/features/chat/data/models/message_model/message_model.dart';

class AudioMessageModel implements MessageModel {
  final String audioBase64;
  @override
  final String senderId;
  @override
  final String createdAt;
  @override
  final String reciverId;
  AudioMessageModel({
    required this.audioBase64,
    required this.senderId,
    required this.createdAt,
    required this.reciverId,
  });
  factory AudioMessageModel.fromJson(Map<String, dynamic> json) {
    return AudioMessageModel(
      audioBase64: json['audioBase64'],
      senderId: json[ChatKeys.kSenderField],
      createdAt: json['createdAt'],
      reciverId: json[ChatKeys.kReciverField],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'audioBase64': audioBase64,
      ChatKeys.kSenderField: senderId,
      'createdAt': createdAt,
      'type': type,
      ChatKeys.kReciverField: reciverId
    };
  }

  @override
  String get type => 'audio';
}
