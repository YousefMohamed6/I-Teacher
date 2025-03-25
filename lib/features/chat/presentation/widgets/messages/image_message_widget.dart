import 'dart:convert';

import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/features/chat/data/models/image_message_model/image_message_model.dart';
import 'package:iteacher/features/chat/presentation/manager/chat_cubit.dart';

class ImageMessageWidget extends StatelessWidget {
  const ImageMessageWidget({
    super.key,
    required this.message,
  });
  final ImageMessageModel message;
  @override
  Widget build(BuildContext context) {
    return BubbleNormalImage(
      id: 'id001',
      image: RepaintBoundary(
        child: Image.memory(
          Base64Decoder().convert(message.imageBase64),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
      color: Theme.of(context).primaryColor,
      isSender: context.read<ChatCubit>().getSender(message.senderId),
    );
  }
}
