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
