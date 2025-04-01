import 'dart:convert';
import 'dart:io';

import 'package:iteacher/features/chat/data/models/audio_message_model/audio_message_model.dart';

class HandleAudioMessageUseCase {
  Future<AudioMessageModel> execute({
    required File file,
    required String senderId,
    required String reciverId,
  }) async {
    final bytes = await file.readAsBytes();
    final message = AudioMessageModel(
      senderId: senderId,
      audioBase64: base64Encode(bytes),
      createdAt: DateTime.now().toString(),
      reciverId: reciverId,
    );
    return message;
  }
}
