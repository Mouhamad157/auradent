import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppFormatter {
  static String getFormattedPrice(int price) {
    String tmp = price.toString();
    String result = '';
    for (int i = 0; i < tmp.characters.length; i++) {
      if ((i % 4 == 0 && i != 0 || i == 1) && tmp.characters.length > 5 ||
          ((i % 5 == 0 && i != 0 || i == 2) && tmp.characters.length <= 5)) {
        result = '$result,${tmp.characters.elementAt(i)}';
      } else {
        result = result + tmp.characters.elementAt(i);
      }
    }
    return result;
  }

  static String getFormattedDate(DateTime date) {
    return date.toIso8601String().substring(0, 10);
  }

  static String getFormattedDay(DateTime date) {
    return DateFormat('EEEE').format(date);
  }
}

class DataFormatter {
  static String formatDate(DateTime dateTime) =>
      DateFormat('d MMM, yyyy').format(dateTime);
}

extension DateTimeUtils on DateTime {
  String get formatDate => DateFormat('d MMM, yyyy').format(this);
  String get sendDate => DateFormat('yyyy-MM-dd').format(this);
}
