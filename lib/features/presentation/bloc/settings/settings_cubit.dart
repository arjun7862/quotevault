import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_accent_color.dart';
import '../../../../core/theme/app_theme_mode.dart';
import '../../../domain/repositiory/settings_repository.dart';
import 'settings_state.dart';


class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository repository;

  SettingsCubit(this.repository)
      : super(
    const SettingsState(
      themeMode: AppThemeMode.dark, // ✅ DEFAULT DARK
      accentColor: AppAccentColor.blue,
      fontScale: AppConstants.defaultFontScale,
    ),
  );

  Future<void> load() async {
    final settings = await repository.loadSettings();
    emit(settings);
  }

  Future<void> updateTheme(AppThemeMode mode) async {
    emit(state.copyWith(themeMode: mode));
    await repository.saveSettings(
      state.copyWith(themeMode: mode),
    );
  }

  Future<void> updateAccent(AppAccentColor color) async {
    emit(state.copyWith(accentColor: color));
    await repository.saveSettings(
      state.copyWith(accentColor: color),
    );
  }

  Future<void> updateFontScale(double scale) async {
    final clamped = scale
        .clamp(
      AppConstants.minFontScale,
      AppConstants.maxFontScale,
    )
        .toDouble();

    emit(state.copyWith(fontScale: clamped));
    await repository.saveSettings(
      state.copyWith(fontScale: clamped),
    );
  }
}