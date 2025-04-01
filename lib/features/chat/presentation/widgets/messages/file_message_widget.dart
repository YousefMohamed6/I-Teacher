import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/features/chat/data/models/file_message_model/file_message_model.dart';
import 'package:iteacher/features/chat/presentation/manager/chat_cubit.dart';

class FileMessageWidget extends StatelessWidget {
  const FileMessageWidget({super.key, required this.message});
  final FileMessageModel message;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();
    final bool isSender = cubit.getSender(message.senderId);
    return Column(
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Card(
          color: isSender ? Color(0xFF1B97F3) : Color(0xFFE8E8EE),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message.fileName,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                IconButton(
                  onPressed: () {
                    cubit.downloadFile(message);
                  },
                  icon: const Icon(
                    Icons.file_download,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
