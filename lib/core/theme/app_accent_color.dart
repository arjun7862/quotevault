import 'package:flutter/material.dart';

enum AppAccentColor {
  blue,
  green,
  purple,
}

extension AppAccentColorX on AppAccentColor {
  Color get color {
    switch (this) {
      case AppAccentColor.green:
        return Colors.green;
      case AppAccentColor.purple:
        return Colors.purple;
      default:
        return Colors.blue;
    }
  }
}