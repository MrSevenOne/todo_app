import 'package:flutter/material.dart';

class DatePickerWidget {
  /// Sana tanlash
  static Future<DateTime?> selectDate(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
  }

  /// Vaqt tanlash
  static Future<TimeOfDay?> selectTime(BuildContext context) async {
    return await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }
}
