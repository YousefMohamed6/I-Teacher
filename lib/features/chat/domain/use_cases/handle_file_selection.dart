import 'dart:convert';

import 'package:iteacher/core/services/file_manager_service.dart';
import 'package:iteacher/features/chat/data/models/file_message_model/file_message_model.dart';

class HandleFileSelectionUseCase {
  final FileManagerService _filePickerService;

  HandleFileSelectionUseCase(this._filePickerService);
  Future<FileMessageModel> execute({
    required String senderId,
    required String reciverId,
  }) async {
    final file = await _filePickerService.pickFile();
    final bytes = await file.readAsBytes();
    final message = FileMessageModel(
      senderId: senderId,
      fileName: file.path.split('/').last,
      fileBase64: base64Encode(bytes),
      createdAt: DateTime.now().toString(),
      reciverId: reciverId,
    );
    return message;
  }
}
