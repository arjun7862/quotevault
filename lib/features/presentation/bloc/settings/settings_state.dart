import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/theme/app_accent_color.dart';
import '../../../../core/theme/app_theme_mode.dart';
part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required AppThemeMode themeMode,
    required AppAccentColor accentColor,
    required double fontScale,
  }) = _SettingsState;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}