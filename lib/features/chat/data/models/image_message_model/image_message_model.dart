import 'package:mrjoo/core/models/user_model.dart';
import 'package:mrjoo/features/chat/data/models/message_model/message_model.dart';

class ImageMessageModel implements MessageModel {
  final String imageBase64;
  @override
  final UserModel userModel;
  @override
  final String createdAt;
  ImageMessageModel({
    required this.imageBase64,
    required this.userModel,
    required this.createdAt,
  });

  @override
  factory ImageMessageModel.fromJson(Map<String, dynamic> json) {
    return ImageMessageModel(
      imageBase64: json['imageBase64'],
      userModel: UserModel.fromJson(json['user']),
      createdAt: json['createdAt'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'imageBase64': imageBase64,
      'user': userModel.toJson(),
      'createdAt': createdAt,
      'type': type
    };
  }

  @override
  String get type => 'image';
}
