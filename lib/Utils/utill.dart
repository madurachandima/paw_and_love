import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:image_picker/image_picker.dart';

Future<DateTime?> getDate(BuildContext context) async {
  DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.calendarOnly);
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
    return weeks;
  } else {
    return 0;
  }
}

Future readjsonFile({required String path}) async {
  var jsonText = await rootBundle.loadString(path);
  return jsonText;
}

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);

  if (_file != null) {
    Uint8List a = await _file.readAsBytes();

    return [a, _file.path];
  }
}
