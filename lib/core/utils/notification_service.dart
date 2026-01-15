import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import '../../features/data/models/quote_model.dart';
import '../constants/app_strings.dart';

class NotificationService {
  static final _plugin = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings();

    await _plugin.initialize(
      const InitializationSettings(
        android: android,
        iOS: ios,
      ),
    );

    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
  }

  static Future<void> scheduleDailyQuote({
    required TimeOfDay time,
    required QuoteModel quote,
  }) async {
    final now = DateTime.now();

    final scheduledToday = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    final scheduledDateTime = scheduledToday.isBefore(now)
        ? scheduledToday.add(const Duration(days: 1))
        : scheduledToday;

    await _plugin.zonedSchedule(
      0,
      AppStrings.quoteOfTheDay,
      quote.text,
      tz.TZDateTime.from(
        scheduledDateTime,
        tz.local,
      ),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_quote',
          'Daily Quote',
          channelDescription: 'Daily motivational quote',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),

      /// ✅ SAFE FOR ANDROID 12+
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,

      /// ✅ Repeat daily at same time
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  /// Optional: cancel daily quote notification
  static Future<void> cancelDailyQuote() async {
    await _plugin.cancel(0);
  }
}