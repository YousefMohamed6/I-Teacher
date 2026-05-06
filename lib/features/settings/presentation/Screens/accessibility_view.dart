import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/settings/presentation/manager/setting_bloc.dart';
import 'package:iteacher/generated/app_localizations.dart';
import 'package:settings_ui/settings_ui.dart';

class AccessibilityView extends StatelessWidget {
  static const String routeName = '/accessibility';
  const AccessibilityView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<SettingsBloc>();
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.of(context)!.accessibility,
        ),
      ),
      body: SettingsList(
        brightness: Theme.of(context).brightness,
        sections: [
          SettingsSection(
            title: Text(AppLocalizations.of(context)!.sign_language_support),
            tiles: <SettingsTile>[
              SettingsTile.switchTile(
                initialValue: bloc.signLanguageMode,
                leading: const Icon(Icons.front_hand_rounded),
                title: CustomText(
                  text: AppLocalizations.of(context)!.sign_language_avatar,
                ),
                onToggle: (value) {
                  bloc.add(UpdateSignLanguageMode(isEnabled: value));
                },
              ),
              SettingsTile.switchTile(
                initialValue: bloc.captionsEnabled,
                leading: const Icon(Icons.closed_caption_rounded),
                title: CustomText(
                  text: AppLocalizations.of(context)!.enable_captions,
                ),
                onToggle: (value) {
                  bloc.add(UpdateCaptionsEnabled(isEnabled: value));
                },
              ),
              SettingsTile.switchTile(
                initialValue: bloc.hapticFeedback,
                leading: const Icon(Icons.vibration_rounded),
                title: CustomText(
                  text: AppLocalizations.of(context)!.haptic_feedback,
                ),
                onToggle: (value) {
                  bloc.add(UpdateHapticFeedback(isEnabled: value));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
