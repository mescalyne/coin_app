import 'package:intl/intl.dart';

extension StringExtension on String {
  static String getOnlyTime(String date) {
    final dateTime = DateTime.parse(date);
    final format = DateFormat('HH:mm:ss');
    return format.format(dateTime.toLocal()).toString();
  }

  static String getOnlyDate(String date) {
    final dateTime = DateTime.parse(date);
    final format = DateFormat('dd:MM');
    return format.format(dateTime.toLocal());
  }
}
