import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/extentions/theme_extension.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
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
          color: isSender ? context.chatSenderColor : context.chatReceiverColor,
          child: Padding(
            padding: EdgeInsets.all(AppDimensions.kPadding16),
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
