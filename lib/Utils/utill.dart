import 'package:flutter/material.dart';
import 'package:paw_and_love/Utils/date_utill_base.dart';

Future<DateTime?> getDate(BuildContext context) async {
  DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2025),
  );
  return selectedDate;
}



// class DogAge {
//   int years;
//   int months;
//   int days;
//   DogAge({this.years = 0, this.months = 0, this.days = 0});
// }

// getTheDogAge(String birthday) {
//   if (birthday != '') {
//     var birthDate = DateTime.tryParse(birthday);
//     if (birthDate != null) {
//       final now = DateTime.now();

//       int years = now.year - birthDate.year;
//       int months = now.month - birthDate.month;
//       int days = now.day - birthDate.day;

//       if (months < 0 || (months == 0 && days < 0)) {
//         years--;
//         months += (days < 0 ? 11 : 12);
//       }

//       if (days < 0) {
//         final monthAgo = DateTime(now.year, now.month - 1, birthDate.day);
//         days = now.difference(monthAgo).inDays + 1;
//       }
// // DogAge(years: years, months: months, days: days);
//       debugPrint("$years $months $days");
//       return DateUtil().getWeek(, days, years);
//     } else {
//       debugPrint('getTheKidsAge: not a valid date');
//     }
//   } else {
//     debugPrint('getTheKidsAge: date is empty');
//   }
//   return null;
// }
