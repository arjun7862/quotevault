import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotevault/core/constants/app_constants.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_theme_mode.dart';
import '../../../core/theme/app_accent_color.dart';
import '../bloc/settings/settings_cubit.dart';
import '../bloc/settings/settings_state.dart';


class SettingsPage extends HookWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.settings)),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              /// Theme Mode
              DropdownButtonFormField<AppThemeMode>(
                value: state.themeMode,
                decoration:
                const InputDecoration(labelText: AppStrings.theme),
                items: AppThemeMode.values
                    .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e.name),
                ))
                    .toList(),
                onChanged: (v) =>
                    context.read<SettingsCubit>().updateTheme(v!),
              ),

              const SizedBox(height: 16),

              /// Accent Color
              DropdownButtonFormField<AppAccentColor>(
                value: state.accentColor,
                decoration: const InputDecoration(
                  labelText: AppStrings.accentColor,
                ),
                items: AppAccentColor.values
                    .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e.name),
                ))
                    .toList(),
                onChanged: (v) =>
                    context.read<SettingsCubit>().updateAccent(v!),
              ),

              const SizedBox(height: 24),

              /// Font Size
              Text(AppStrings.fontSize),
              Slider(
                value: state.fontScale
                    .clamp(
                  AppConstants.minFontScale,
                  AppConstants.maxFontScale,
                )
                    .toDouble(),
                min: AppConstants.minFontScale,
                max: AppConstants.maxFontScale,
                divisions: 5,
                label:
                '${(state.fontScale * AppConstants.defaultFontScale).round()}',
                onChanged: (v) =>
                    context.read<SettingsCubit>().updateFontScale(v),
              ),
            ],
          );
        },
      ),
    );
  }
}