import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/features/chat/presentation/manager/chat_cubit.dart';

class AudioRecorderButton extends StatelessWidget {
  const AudioRecorderButton({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ChatCubit>();
    return Center(
      child: GestureDetector(
        onLongPress: () {
          cubit.startRecording();
        },
        onLongPressEnd: (details) {
          if (details.localPosition.dx < -50) {
            cubit.cancelRecord();
          } else {
            cubit.stopRecording();
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: cubit.audioRecorder.isRecording ? Colors.red : Colors.blue,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.mic,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}
