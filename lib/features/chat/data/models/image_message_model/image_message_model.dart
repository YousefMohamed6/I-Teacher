import 'package:iteacher/core/utils/constants/firebase_keys.dart';
import 'package:iteacher/features/chat/data/models/message_model/message_model.dart';

class ImageMessageModel implements MessageModel {
  final String imageBase64;
  @override
  final String senderId;
  @override
  final String createdAt;
  @override
  final String reciverId;
  ImageMessageModel(
      {required this.imageBase64,
      required this.senderId,
      required this.createdAt,
      required this.reciverId});

  @override
  factory ImageMessageModel.fromJson(Map<String, dynamic> json) {
    return ImageMessageModel(
      imageBase64: json['imageBase64'],
      senderId: json[ChatKeys.kSenderField],
      createdAt: json['createdAt'],
      reciverId: json[ChatKeys.kReciverField],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'imageBase64': imageBase64,
      ChatKeys.kSenderField: senderId,
      'createdAt': createdAt,
      'type': type,
      ChatKeys.kReciverField: reciverId
    };
  }

  @override
  String get type => 'image';
}
