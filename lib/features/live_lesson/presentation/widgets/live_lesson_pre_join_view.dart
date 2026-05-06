import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/generated/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';

class LiveLessonPreJoinView extends StatefulWidget {
  const LiveLessonPreJoinView({
    super.key,
    required this.onPermissionsGranted,
  });

  final VoidCallback onPermissionsGranted;

  @override
  State<LiveLessonPreJoinView> createState() => _LiveLessonPreJoinViewState();
}

class _LiveLessonPreJoinViewState extends State<LiveLessonPreJoinView> {
  bool _isChecking = true;

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    final status = await [
      Permission.camera,
      Permission.microphone,
    ].request();

    if (status[Permission.camera]!.isGranted &&
        status[Permission.microphone]!.isGranted) {
      widget.onPermissionsGranted();
    } else {
      setState(() {
        _isChecking = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.kPadding20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.videocam_rounded,
                size: 80.sp,
                color: Theme.of(context).primaryColor,
              ).animate().scale(duration: 600.ms, curve: Curves.elasticOut),
              SizedBox(height: AppDimensions.kPadding24),
              CustomText(
                text: _isChecking ? l10n.preparing_lesson : l10n.permissions_required,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: AppDimensions.kPadding8),
              CustomText(
                text: _isChecking
                    ? l10n.please_wait_while_we_setup
                    : l10n.we_need_camera_mic_access,
                textAlign: TextAlign.center,
                color: Colors.grey,
              ),
              if (!_isChecking) ...[
                SizedBox(height: AppDimensions.kPadding32),
                ElevatedButton(
                  onPressed: _checkPermissions,
                  child: Text(l10n.grant_permissions),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
