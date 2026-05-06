import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/features/chat/presentation/manager/chat_cubit.dart';
import 'package:iteacher/features/chat/presentation/widgets/sign_stickers_grid.dart';

class SignStickerButton extends StatelessWidget {
  const SignStickerButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ChatCubit>(context);
    return IconButton(
      padding: EdgeInsets.zero,
      icon: const Icon(
        Icons.emoji_emotions_outlined,
        color: Colors.blue,
        size: 24,
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (_) => SignStickersGrid(
            onStickerSelected: (sticker) {
              cubit.sendStickerMessage(
                stickerUrl: sticker.url,
                stickerId: sticker.id,
              );
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}
