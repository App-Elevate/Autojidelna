import 'package:autojidelna/src/types/theme.dart';
import 'package:intl/intl.dart';

/// Returns correctly formated date string
///
/// [format]      | what format it should use
///
/// [date]        | date to be formated, if null returns DateTime.now()
///
/// [inSettings]  | If true, adds a "title" to the date -> ex. "d. M. y (1.1.2024)"
String getCorrectDateString(DateFormatOptions format, {DateTime? date, bool inSettings = false}) {
  String formatStr;
  switch (format) {
    case DateFormatOptions.ddmmmyyyy:
      formatStr = 'dd MMM yyyy';
      break;
    case DateFormatOptions.ddmmyy:
      formatStr = 'dd/MM/yy';
      break;
    case DateFormatOptions.mmddyy:
      formatStr = 'MM/dd/yy';
      break;
    case DateFormatOptions.mmmddyyyy:
      formatStr = 'MMM dd, yyyy';
      break;
    case DateFormatOptions.yyyymmdd:
      formatStr = 'yyy-MM-dd';
      break;
    default:
      formatStr = 'd. M. y';
  }
  String dateStr = DateFormat(formatStr).format(date ?? DateTime.now());
  String settingsStr = '$formatStr ($dateStr)';
  return inSettings ? settingsStr : dateStr;
}
