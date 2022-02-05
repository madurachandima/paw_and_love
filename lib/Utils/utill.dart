import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<DateTime?> getDate(BuildContext context) async {
  DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2025),
  );
  return selectedDate;
}

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

getDaysByWeeks(int days) {
  int weeks;
  if (days > 7) {
    weeks = days ~/ 7;
    debugPrint(weeks.toString());
  }
}

Future readjsonFile({required String path}) async {
  var jsonText = await rootBundle.loadString(path);
  return jsonText;
}
