import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/extentions/theme_extension.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
import 'package:iteacher/features/chat/presentation/manager/chat_cubit.dart';

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
          padding: EdgeInsets.all(AppDimensions.kPadding8),
          margin: EdgeInsets.all(AppDimensions.kPadding4),
          decoration: BoxDecoration(
            color: cubit.audioRecorder.isRecording
                ? context.theme.colorScheme.error
                : context.theme.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.mic,
            color: context.theme.colorScheme.onPrimary,
            size: 24,
          ),
        ),
      ),
    );
  }
}
