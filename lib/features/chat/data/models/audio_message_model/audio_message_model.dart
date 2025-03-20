import 'package:mrjoo/core/models/user_model.dart';
import 'package:mrjoo/core/utils/constants/firebase_keys.dart';
import 'package:mrjoo/features/chat/data/models/message_model/message_model.dart';

class AudioMessageModel implements MessageModel {
  final String audioBase64;
  @override
  final UserModel userModel;
  @override
  final String createdAt;
  @override
  final String reciverId;
  AudioMessageModel({
    required this.audioBase64,
    required this.userModel,
    required this.createdAt,
    required this.reciverId,
  });
  factory AudioMessageModel.fromJson(Map<String, dynamic> json) {
    return AudioMessageModel(
      audioBase64: json['audioBase64'],
      userModel: UserModel.fromJson(json['user']),
      createdAt: json['createdAt'],
      reciverId: json[ChatKeys.kReciverField],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'audioBase64': audioBase64,
      'user': userModel.toJson(),
      'createdAt': createdAt,
      'type': type,
      ChatKeys.kReciverField: reciverId
    };
  }

  @override
  String get type => 'audio';
}
