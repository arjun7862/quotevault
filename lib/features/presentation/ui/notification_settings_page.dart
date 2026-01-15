import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quotevault/core/constants/constant_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/utils/notification_service.dart';
import '../bloc/daily_quotes/daily_quote_bloc.dart';
import '../bloc/daily_quotes/daily_quote_state.dart';

class NotificationSettingsPage extends HookWidget {
  const NotificationSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// ✅ Default time = 09:00
    final selectedTime = useState(const TimeOfDay(hour: 9, minute: 0));
    final isLoaded = useState(false);

    /// 🔹 Load saved time ONCE
    useEffect(() {
      Future<void> loadSavedTime() async {
        final prefs = await SharedPreferences.getInstance();
        final hour =
        prefs.getInt(ConstantKeys.notificationHour);
        final minute =
        prefs.getInt(ConstantKeys.notificationMinute);

        if (hour != null && minute != null) {
          selectedTime.value = TimeOfDay(hour: hour, minute: minute);
        }

        isLoaded.value = true;
      }

      loadSavedTime();
      return null;
    }, const []);

    /// Avoid UI interaction before loading prefs
    if (!isLoaded.value) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.notifications),
      ),
      body: ListTile(
        leading: const Icon(Icons.notifications_active_outlined),
        title: const Text(AppStrings.notificationTime),
        subtitle: Text(selectedTime.value.format(context)),
        trailing: const Icon(Icons.chevron_right),
        onTap: () async {
          final picked = await showTimePicker(
            context: context,
            initialTime: selectedTime.value,
          );

          if (picked == null) return;

          selectedTime.value = picked;

          /// ✅ Persist time
          final prefs = await SharedPreferences.getInstance();
          await prefs.setInt(
              ConstantKeys.notificationHour, picked.hour);
          await prefs.setInt(
              ConstantKeys.notificationMinute, picked.minute);

          /// ✅ Get today quote
          final quote = context
              .read<DailyQuoteBloc>()
              .state
              .maybeWhen(
            loaded: (q) => q,
            orElse: () => null,
          );

          if (quote != null) {
            await NotificationService.scheduleDailyQuote(
              time: picked,
              quote: quote,
            );
          }

          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(AppStrings.notificationUpdated),
              ),
            );
          }
        },
      ),
    );
  }
}