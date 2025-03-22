import 'dart:convert';
import 'dart:io';

import 'package:iteacher/core/models/user_model.dart';
import 'package:iteacher/features/chat/data/models/audio_message_model/audio_message_model.dart';

class HandleAudioMessageUseCase {
  Future<AudioMessageModel> execute({
    required File file,
    required UserModel userModel,
    required String reciverId,
  }) async {
    final bytes = await file.readAsBytes();
    final message = AudioMessageModel(
      userModel: userModel,
      audioBase64: base64Encode(bytes),
      createdAt: DateTime.now().toString(),
      reciverId: reciverId,
    );
    return message;
  }
}
