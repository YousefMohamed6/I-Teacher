import 'package:flutter/material.dart';
import 'package:iteacher/core/services/zego_config.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/live_lesson/domain/entities/live_lesson_entity.dart';
import 'package:iteacher/generated/app_localizations.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class StudentLiveView extends StatelessWidget {
  const StudentLiveView({
    super.key,
    required this.lesson,
    required this.userId,
    required this.userName,
  });

  final LiveLessonEntity lesson;
  final String userId;
  final String userName;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final config = ZegoUIKitPrebuiltLiveStreamingConfig.audience();

    // Sign Language Mode: Gallery layout for equal visibility
    if (lesson.type == LiveLessonType.signLanguage) {
      config.layout = ZegoLayout.gallery();
    } else {
      config.layout = ZegoLayout.pictureInPicture();
    }

    config
      ..audioVideoView.useVideoViewAspectFill = true
      ..confirmDialogInfo = ZegoLiveStreamingDialogInfo(
        title: l10n.end_lesson,
        message: l10n.are_you_sure_you_want_to_end_the_lesson,
        cancelButtonName: l10n.cancel,
        confirmButtonName: l10n.confirm,
      )
      ..avatarBuilder = (context, size, user, extraInfo) {
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.primaryColor.withValues(alpha: 0.1),
          ),
          child: Center(
            child: CustomText(
              text: user?.name.substring(0, 1).toUpperCase() ?? '',
              fontSize: AppDimensions.kPadding16,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      };

    return Scaffold(
      body: SafeArea(
        child: ZegoUIKitPrebuiltLiveStreaming(
          appID: ZegoConfig.appID,
          appSign: ZegoConfig.appSign,
          userID: userId,
          userName: userName,
          liveID: lesson.id,
          config: config,
        ),
      ),
    );
  }
}
