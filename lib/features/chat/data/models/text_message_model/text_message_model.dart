import 'package:iteacher/core/models/user_model.dart';
import 'package:iteacher/core/utils/constants/firebase_keys.dart';
import 'package:iteacher/features/chat/data/models/message_model/message_model.dart';

class TextMessageModel implements MessageModel {
  final String text;
  @override
  final UserModel userModel;
  @override
  final String createdAt;
  @override
  final String reciverId;

  TextMessageModel({
    required this.text,
    required this.userModel,
    required this.createdAt,
    required this.reciverId,
  });
  factory TextMessageModel.fromJson(Map<String, dynamic> json) {
    return TextMessageModel(
      text: json['text'],
      userModel: UserModel.fromJson(json['user']),
      createdAt: json['createdAt'],
      reciverId: json[ChatKeys.kReciverField],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'user': userModel.toJson(),
      'createdAt': createdAt,
      'type': type,
      ChatKeys.kReciverField: reciverId
    };
  }

  @override
  String get type => 'text';
}
