import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalize() => toBeginningOfSentenceCase(this);
  bool isSameUrl(String url) {
    final RegExp regex = RegExp(r'(?:https?:\/\/)?([^\/]+)');
    final RegExpMatch? match = regex.firstMatch(url);
    return match == null ? false : true;
  }
}
