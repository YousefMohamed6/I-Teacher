import 'package:flutter/material.dart';
import 'package:iteacher/features/chat/data/models/audio_message_model/audio_message_model.dart';
import 'package:iteacher/features/chat/data/models/file_message_model/file_message_model.dart';
import 'package:iteacher/features/chat/data/models/image_message_model/image_message_model.dart';
import 'package:iteacher/features/chat/data/models/message_model/message_model.dart';
import 'package:iteacher/features/chat/data/models/text_message_model/text_message_model.dart';
import 'package:iteacher/features/chat/presentation/widgets/messages/audio_message_widget.dart';
import 'package:iteacher/features/chat/presentation/widgets/messages/file_message_widget.dart';
import 'package:iteacher/features/chat/presentation/widgets/messages/image_message_widget.dart';
import 'package:iteacher/features/chat/presentation/widgets/messages/text_message_widget.dart';

class CustomMessageWidget extends StatelessWidget {
  const CustomMessageWidget({super.key, required this.message});
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    switch (message.type) {
      case 'text':
        return TextMessageWidget(message: message as TextMessageModel);
      case 'audio':
        return AudioMessageWidget(message: message as AudioMessageModel);
      case 'image':
        return ImageMessageWidget(message: message as ImageMessageModel);
      case 'file':
        return FileMessageWidget(message: message as FileMessageModel);
      default:
        return SizedBox();
    }
  }
}
