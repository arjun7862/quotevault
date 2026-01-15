import '../../presentation/bloc/settings/settings_state.dart';

abstract class SettingsRepository {
  Future<SettingsState> loadSettings();
  Future<void> saveSettings(SettingsState state);
}