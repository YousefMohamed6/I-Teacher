import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/core/utils/constants/app_fonts.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/chat/data/model/message_model.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.alignmentMessage,
    required this.bottonRightRedius,
    required this.bottonLeftRedius,
    required this.bubbleColor,
    required this.message,
    required this.time,
  });
  final MessageModel message;
  final DateTime time;
  final AlignmentGeometry alignmentMessage;
  final double bottonRightRedius;
  final double bottonLeftRedius;
  final Color bubbleColor;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignmentMessage,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 4, right: 8, top: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: const Radius.circular(24),
            topLeft: const Radius.circular(24),
            bottomLeft: Radius.circular(bottonLeftRedius),
            bottomRight: Radius.circular(bottonRightRedius),
          ),
          color: bubbleColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: alignmentMessage == Alignment.topRight
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: message.displayName,
              overflow: TextOverflow.ellipsis,
              color: AppColors.kMainTextColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  verticalDirection: VerticalDirection.up,
                  children: [
                    CustomText(
                      text: DateFormat('hh:mm a').format(time),
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.kMainTextColor,
                      fontSize: 12,
                      fontFamily: AppFonts.kFontHandjet,
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                CustomText(
                  text: message.content,
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.kMainTextColor,
                  fontSize: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
