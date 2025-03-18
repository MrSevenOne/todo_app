import 'package:intl/intl.dart';

class DateTimeFormatted {
  /// Timeni formatlash M: 14:40
  static String timeFormat({required DateTime time}) {
    String formattedTime = DateFormat.Hms().format(time);
    return formattedTime;
  }
}
