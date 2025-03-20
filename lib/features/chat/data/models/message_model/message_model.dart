import 'package:mrjoo/core/models/user_model.dart';
import 'package:mrjoo/features/chat/data/models/audio_message_model/audio_message_model.dart';
import 'package:mrjoo/features/chat/data/models/file_message_model/file_message_model.dart';
import 'package:mrjoo/features/chat/data/models/image_message_model/image_message_model.dart';
import 'package:mrjoo/features/chat/data/models/text_message_model/text_message_model.dart';

abstract class MessageModel {
  final UserModel userModel;
  final String createdAt;
  final String type;
  final String reciverId;
  MessageModel(this.userModel, this.createdAt, this.type, this.reciverId);
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    switch (json["type"]) {
      case "text":
        return TextMessageModel.fromJson(json);
      case "audio":
        return AudioMessageModel.fromJson(json);
      case "image":
        return ImageMessageModel.fromJson(json);
      case "file":
        return FileMessageModel.fromJson(json);
      default:
        throw Exception('unknown message type');
    }
  }
  Map<String, dynamic> toJson();
}
