part of 'setting_bloc.dart';

sealed class SettingEvent {
  const SettingEvent();
}

final class GetLocalization extends SettingEvent {}

final class GetTheme extends SettingEvent {}

final class UpdateLocalization extends SettingEvent {
  final String local;
  const UpdateLocalization({required this.local});
}

final class UpdateTheme extends SettingEvent {
  const UpdateTheme();
}

final class GetAccessibility extends SettingEvent {}

final class UpdateSignLanguageMode extends SettingEvent {
  final bool isEnabled;
  const UpdateSignLanguageMode({required this.isEnabled});
}

final class UpdateCaptionsEnabled extends SettingEvent {
  final bool isEnabled;
  const UpdateCaptionsEnabled({required this.isEnabled});
}

final class UpdateHapticFeedback extends SettingEvent {
  final bool isEnabled;
  const UpdateHapticFeedback({required this.isEnabled});
}
