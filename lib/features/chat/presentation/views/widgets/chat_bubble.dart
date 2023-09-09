import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/constants/fonts.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
    required this.alignmentMessage,
    required this.time,
    required this.bottonRightRedius,
    required this.bottonLeftRedius,
    required this.bubbleColor,
    required this.fullName,
  });

  final String message;
  final String fullName;
  final String time;
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
            Text(
              fullName,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: kMainTextColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
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
                    Text(
                      time,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: kMainTextColor,
                        fontSize: 12,
                        fontFamily: kFontHandjet,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Text(
                  message,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: kMainTextColor,
                      fontSize: 20,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
