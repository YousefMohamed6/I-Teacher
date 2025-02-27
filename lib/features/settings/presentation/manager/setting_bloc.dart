import 'package:bloc/bloc.dart';
import 'package:mrjoo/core/services/sf_service.dart';
import 'package:mrjoo/core/utils/constants/sf_keys.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingsBloc extends Bloc<SettingEvent, SettingsState> {
  bool isDark = false;
  String local = 'en';
  SettingsBloc() : super(SettingInitial()) {
    //========================================
    on<GetLocalization>((event, emit) async {
      local = await SharedPreferencesService.getString(SfKeys.local) ?? 'en';
      emit(UpdateUI());
    });
    //========================================
    on<GetTheme>((event, emit) async {
      isDark = await SharedPreferencesService.getBool(SfKeys.theme,
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
  }
}
