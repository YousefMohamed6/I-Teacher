import 'package:iteacher/features/chat/data/models/message_model/message_model.dart';

class StickerMessageModel extends MessageModel {
  final String stickerUrl;
  final String stickerId;

  StickerMessageModel({
    required String senderId,
    required String createdAt,
    required String receiverId,
    required this.stickerUrl,
    required this.stickerId,
  }) : super(senderId, createdAt, "sticker", receiverId);

  factory StickerMessageModel.fromJson(Map<String, dynamic> json) {
    return StickerMessageModel(
      senderId: json['senderId'] as String,
      createdAt: json['createdAt'] as String,
      receiverId: json['receiverId'] as String,
      stickerUrl: json['stickerUrl'] as String,
      stickerId: json['stickerId'] as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'createdAt': createdAt,
      'type': type,
      'receiverId': receiverId,
      'stickerUrl': stickerUrl,
      'stickerId': stickerId,
    };
  }
}
