import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static String formatMediumDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  static String formatShortDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String formatLongDate(DateTime date) {
    return DateFormat('MMMM dd, yyyy').format(date);
  }

  static String formatDayWithMonth(DateTime date) {
    return DateFormat('E, MMM dd').format(date);
  }

  static String formatTime(DateTime date) {
    return DateFormat('hh:mm a').format(date);
  }

  static String formatDateTime(DateTime date) {
    return DateFormat('MMM dd, yyyy hh:mm a').format(date);
  }

  static String formatDuration(DateTime startDate, DateTime endDate) {
    final days = endDate.difference(startDate).inDays + 1;
    return days == 1 ? '1 day' : '$days days';
  }

  static String getRelativeDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final targetDate = DateTime(date.year, date.month, date.day);
    final difference = targetDate.difference(today).inDays;

    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Tomorrow';
    } else if (difference == -1) {
      return 'Yesterday';
    } else if (difference > 1 && difference <= 7) {
      return 'In $difference days';
    } else if (difference < -1 && difference >= -7) {
      return '${difference.abs()} days ago';
    } else {
      return formatMediumDate(date);
    }
  }
}
