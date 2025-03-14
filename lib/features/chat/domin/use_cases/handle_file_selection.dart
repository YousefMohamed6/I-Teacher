import 'dart:convert';

import 'package:mrjoo/core/models/user_model.dart';
import 'package:mrjoo/core/services/file_service.dart';
import 'package:mrjoo/features/chat/data/models/file_message_model/file_message_model.dart';

class HandleFileSelectionUseCase {
  final FileService _filePickerService;

  HandleFileSelectionUseCase(this._filePickerService);
  Future<FileMessageModel> execute({required UserModel userModel}) async {
    final file = await _filePickerService.pickFile();
    final bytes = await file.readAsBytes();
    final message = FileMessageModel(
      userModel: userModel,
      fileName: file.path.split('/').last,
      fileBase64: base64Encode(bytes),
      createdAt: DateTime.now().toString(),
    );
    return message;
  }
}
