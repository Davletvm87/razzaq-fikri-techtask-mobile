import 'package:intl/intl.dart';

extension DateHelpers on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.day == this.day &&
        now.month == this.month &&
        now.year == this.year;
  }

  bool isTomorrow() {
    final tomorrow = DateTime.now().add(Duration(days: 1));
    return tomorrow.day == this.day &&
        tomorrow.month == this.month &&
        tomorrow.year == this.year;
  }
}

class FormatDate {
  static String getStringFormattedDateTime(DateTime date) {
    return date.isToday()
        ? "Today, ${DateFormat("dd/MM/yyyy").format(date)}"
        : date.isTomorrow()
            ? "Tomorrow, ${DateFormat("dd/MM/yyyy").format(date)}"
            : DateFormat("dd/MM/yyyy").format(date);
  }

  String getFormattedDateTime(String date) {
    var d = DateTime.parse(date);
    return new DateFormat("dd-MM-yyyy\nHH:mm", "id").format(d);
  }
}
