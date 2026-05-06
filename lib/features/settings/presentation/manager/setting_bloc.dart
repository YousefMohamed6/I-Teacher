import 'package:bloc/bloc.dart';
import 'package:iteacher/core/services/sf_service.dart';
import 'package:iteacher/core/utils/constants/sf_keys.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingsBloc extends Bloc<SettingEvent, SettingsState> {
  bool isDark = false;
  String local = 'ar';
  bool signLanguageMode = false;
  bool captionsEnabled = false;
  bool hapticFeedback = false;

  SettingsBloc() : super(SettingInitial()) {
    //========================================
    on<GetLocalization>((event, emit) async {
      local = await SharedPreferencesService.getString(SfKeys.local) ?? 'ar';
      emit(UpdateUI());
    });
    //========================================
    on<GetTheme>((event, emit) async {
      isDark = await SharedPreferencesService.getBool(SfKeys.theme,
          defaultIfNull: false);
      emit(UpdateUI());
    });
    //========================================
    on<GetAccessibility>((event, emit) async {
      signLanguageMode = await SharedPreferencesService.getBool(
          SfKeys.signLanguageMode,
          defaultIfNull: false);
      captionsEnabled = await SharedPreferencesService.getBool(
          SfKeys.captionsEnabled,
          defaultIfNull: false);
      hapticFeedback = await SharedPreferencesService.getBool(
          SfKeys.hapticFeedback,
          defaultIfNull: false);
      emit(UpdateUI());
    });
    //========================================
    on<UpdateLocalization>((event, emit) async {
      local = event.local;
      await SharedPreferencesService.saveString(SfKeys.local, local);
      emit(UpdateUI());
    });
    //========================================
    on<UpdateTheme>((event, emit) async {
      isDark = !isDark;
      await SharedPreferencesService.saveBool(SfKeys.theme, isDark);
      emit(UpdateUI());
    });
    //========================================
    on<UpdateSignLanguageMode>((event, emit) async {
      signLanguageMode = event.isEnabled;
      await SharedPreferencesService.saveBool(
          SfKeys.signLanguageMode, signLanguageMode);
      emit(UpdateUI());
    });
    //========================================
    on<UpdateCaptionsEnabled>((event, emit) async {
      captionsEnabled = event.isEnabled;
      await SharedPreferencesService.saveBool(
          SfKeys.captionsEnabled, captionsEnabled);
      emit(UpdateUI());
    });
    //========================================
    on<UpdateHapticFeedback>((event, emit) async {
      hapticFeedback = event.isEnabled;
      await SharedPreferencesService.saveBool(
          SfKeys.hapticFeedback, hapticFeedback);
      emit(UpdateUI());
    });
  }
}
