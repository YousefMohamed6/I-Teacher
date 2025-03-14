import 'package:mrjoo/core/models/user_model.dart';
import 'package:mrjoo/features/chat/data/models/message_model/message_model.dart';

class AudioMessageModel implements MessageModel {
  final String audioBase64;
  @override
  final UserModel userModel;
  @override
  final String createdAt;

  AudioMessageModel({
    required this.audioBase64,
    required this.userModel,
    required this.createdAt,
  });
  factory AudioMessageModel.fromJson(Map<String, dynamic> json) {
    return AudioMessageModel(
      audioBase64: json['audioBase64'],
      userModel: UserModel.fromJson(json['user']),
      createdAt: json['createdAt'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'audioBase64': audioBase64,
      'user': userModel.toJson(),
      'createdAt': createdAt,
      'type': type
    };
  }

  @override
  String get type => 'audio';
}
