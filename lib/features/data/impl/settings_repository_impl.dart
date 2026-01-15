import 'package:quotevault/core/utils/supabase_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/constant_keys.dart';
import '../../../core/theme/app_theme_mode.dart';
import '../../../core/theme/app_accent_color.dart';
import '../../domain/repositiory/settings_repository.dart';
import '../../presentation/bloc/settings/settings_state.dart';

class SettingsRepositoryImpl implements SettingsRepository {


  @override
  Future<SettingsState> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final user = supabase.auth.currentUser;

    /// -------- FIRST INSTALL → FORCE DARK --------
    if (!prefs.containsKey(ConstantKeys.themeMode)) {
      await prefs.setString(
        ConstantKeys.themeMode,
        AppThemeMode.dark.name,
      );
    }

    final themeName =
        prefs.getString(ConstantKeys.themeMode) ?? AppThemeMode.dark.name;

    final accentIndex =
        prefs.getInt(ConstantKeys.accentColor) ?? AppAccentColor.blue.index;

    final rawScale =
        prefs.getDouble(ConstantKeys.fontScale) ?? AppConstants.defaultFontScale;

    final normalizedScale = rawScale > 3
        ? rawScale / AppConstants.defaultFontScale
        : rawScale;

    SettingsState local = SettingsState(
      themeMode: AppThemeMode.values.firstWhere(
            (e) => e.name == themeName,
        orElse: () => AppThemeMode.dark,
      ),
      accentColor: AppAccentColor.values[accentIndex],
      fontScale: normalizedScale
          .clamp(
        AppConstants.minFontScale,
        AppConstants.maxFontScale,
      )
          .toDouble(),
    );

    /// -------- NO USER --------
    if (user == null) return local;

    /// -------- CLOUD --------
    final profile = await supabase
        .from('profiles')
        .select()
        .eq('user_id', user.id)
        .maybeSingle();

    if (profile == null) return local;

    final cloudTheme = profile['theme'] as String?;
    final cloudFontSize = profile['font_size'] as int?;

    return local.copyWith(
      themeMode: cloudTheme != null
          ? AppThemeMode.values.firstWhere(
            (e) => e.name == cloudTheme,
        orElse: () => local.themeMode,
      )
          : local.themeMode,
      fontScale: cloudFontSize != null
          ? (cloudFontSize / AppConstants.defaultFontScale)
          .clamp(
        AppConstants.minFontScale,
        AppConstants.maxFontScale,
      )
          .toDouble()
          : local.fontScale,
    );
  }

  @override
  Future<void> saveSettings(SettingsState state) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      ConstantKeys.themeMode,
      state.themeMode.name,
    );
    await prefs.setInt(
      ConstantKeys.accentColor,
      state.accentColor.index,
    );
    await prefs.setDouble(
      ConstantKeys.fontScale,
      state.fontScale,
    );

    final user = supabase.auth.currentUser;
    if (user == null) return;

    await supabase.from('profiles').upsert({
      'user_id': user.id,
      'theme': state.themeMode.name,
      'font_size': (state.fontScale * AppConstants.defaultFontScale).round(),
    });
  }
}