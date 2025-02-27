part of 'setting_bloc.dart';

sealed class SettingsState {
  const SettingsState();
}

final class SettingInitial extends SettingsState {}

final class UpdateUI extends SettingsState {}
