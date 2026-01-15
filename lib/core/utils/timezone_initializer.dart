import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class TimezoneInitializer {
  static Future<void> init() async {
    /// ✅ This loads the full timezone database
    tz.initializeTimeZones();

    /// ✅ This safely sets local timezone automatically
    tz.setLocalLocation(tz.local);
  }
}