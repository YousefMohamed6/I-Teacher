import 'package:mrjoo/core/models/user_model.dart';
import 'package:mrjoo/features/chat/data/models/message_model/message_model.dart';

class TextMessageModel implements MessageModel {
  final String text;
  @override
  final UserModel userModel;
  @override
  final String createdAt;

  TextMessageModel({
    required this.text,
    required this.userModel,
    required this.createdAt,
  });
  factory TextMessageModel.fromJson(Map<String, dynamic> json) {
    return TextMessageModel(
      text: json['text'],
      userModel: UserModel.fromJson(json['user']),
      createdAt: json['createdAt'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'user': userModel.toJson(),
      'createdAt': createdAt,
      'type': type
    };
  }

  @override
  String get type => 'text';
}
