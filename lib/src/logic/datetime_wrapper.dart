import 'package:autojidelna/src/_global/providers/dishes_of_the_day_provider.dart';

DateTime convertIndexToDatetime(int index) {
  DateTime newDate = minimalDate.add(Duration(days: index));
  while (newDate.hour != 0 && newDate.hour > 12) {
    newDate = newDate.add(const Duration(hours: 1));
  }
  while (newDate.hour != 0 && newDate.hour < 12) {
    newDate = newDate.subtract(const Duration(hours: 1));
  }
  return newDate;
}

int convertDateTimeToIndex(DateTime date) => minimalDate.difference(date).inDays.abs();

extension IsWeekend on DateTime {
  bool get isWeekend => weekday > 5;
}
