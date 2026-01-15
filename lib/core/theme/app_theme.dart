import 'package:flutter/material.dart';

import 'app_accent_color.dart';

class AppTheme {
  static ThemeData light({
    required AppAccentColor accent,
  }) {
    return ThemeData(
      brightness: Brightness.light,
      colorSchemeSeed: accent.color,
      useMaterial3: true,
    );
  }

  static ThemeData dark({
    required AppAccentColor accent,
  }) {
    return ThemeData(
      brightness: Brightness.dark,
      colorSchemeSeed: accent.color,
      useMaterial3: true,
    );
  }
}
