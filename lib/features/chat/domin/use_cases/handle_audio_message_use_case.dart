import 'dart:convert';
import 'dart:io';

import 'package:mrjoo/core/models/user_model.dart';
import 'package:mrjoo/features/chat/data/models/audio_message_model/audio_message_model.dart';

class HandleAudioMessageUseCase {
  Future<AudioMessageModel> execute({
    required File file,
    required UserModel userModel,
  }) async {
    final bytes = await file.readAsBytes();
    final message = AudioMessageModel(
      userModel: userModel,
      audioBase64: base64Encode(bytes),
      createdAt: DateTime.now().toString(),
    );
    return message;
  }
}
