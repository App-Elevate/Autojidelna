import 'package:autojidelna/src/_conf/dates.dart';

DateTime convertIndexToDatetime(int index) {
  DateTime newDate = Dates.minimalDate.add(Duration(days: index));
  while (newDate.hour != 0 && newDate.hour > 12) {
    newDate = newDate.add(const Duration(hours: 1));
  }
  while (newDate.hour != 0 && newDate.hour < 12) {
    newDate = newDate.subtract(const Duration(hours: 1));
  }
  return newDate;
}

int convertDateTimeToIndex(DateTime date) => Dates.minimalDate.difference(date).inDays.abs();

extension IsWeekend on DateTime {
  bool get isWeekend => weekday > 5;
}
