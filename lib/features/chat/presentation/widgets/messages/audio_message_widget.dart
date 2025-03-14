import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/core/services/audio_player_service.dart';
import 'package:mrjoo/features/chat/data/models/audio_message_model/audio_message_model.dart';

class AudioMessageWidget extends StatelessWidget {
  const AudioMessageWidget({super.key, required this.message});
  final AudioMessageModel message;

  @override
  Widget build(BuildContext context) {
    final AudioPlayerService audioPlayer = AudioPlayerService();
    return StreamBuilder<Duration?>(
        stream: audioPlayer.instance.positionStream,
        initialData: Duration.zero,
        builder: (context, snapshot) {
          return RepaintBoundary(
            child: BubbleNormalAudio(
              color: Color(0xFF1B97F3),
              position: snapshot.data?.inSeconds.toDouble(),
              duration: audioPlayer.duration?.inSeconds.toDouble(),
              isPlaying: audioPlayer.isPlaying,
              isLoading: false,
              isPause: !audioPlayer.isPlaying,
              onSeekChanged: (seek) {
                audioPlayer.setSeek(seek);
              },
              onPlayPauseButtonClick: () {
                audioPlayer.isPlaying
                    ? audioPlayer.stop()
                    : audioPlayer.playFromBase64(message.audioBase64);
              },
            ),
          );
        });
  }
}

class RecordAudio extends StatelessWidget {
  const RecordAudio({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [],
      ),
    );
  }
}
