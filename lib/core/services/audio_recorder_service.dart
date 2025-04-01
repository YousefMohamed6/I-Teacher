import 'dart:io';

import 'package:record/record.dart';

class AudioRecorderService {
  final AudioRecorder _audioRecorder = AudioRecorder();
  String? audioPath;
  bool isRecording = false;
  bool cancelRecording = false;
  Future<void> startRecording() async {
    if (await _audioRecorder.hasPermission()) {
      final Directory tempDir = Directory.systemTemp;
      audioPath =
          '${tempDir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.mp3';
      await _audioRecorder.start(RecordConfig(), path: audioPath!);
      isRecording = true;
    }
  }

  Future<void> stopRecording() async {
    if (!cancelRecording) {
      await _audioRecorder.stop();
      isRecording = false;
    }
  }

  Future<void> cancelRecord() async {
    cancelRecording = true;
    await _audioRecorder.stop();
    isRecording = false;
    audioPath = null;
  }

  Future<void> dispose() async {
    await _audioRecorder.dispose();
  }
}
