import 'dart:typed_data';

import 'package:mrjoo/core/services/file_service.dart';

class DownloadFilesUseCase {
  final FileService _fileService;

  DownloadFilesUseCase(this._fileService);
  Future<void> execute({
    required String fileName,
    required Uint8List bytes,
  }) async {
    await _fileService.saveFile(fileName: fileName, bytes: bytes);
  }
}
