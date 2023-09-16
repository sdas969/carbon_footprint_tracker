import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: DatePicker(
        DateTime.now(),
        dayTextStyle: const TextStyle(color: Colors.white),
        dateTextStyle: const TextStyle(color: Colors.white),
        monthTextStyle: const TextStyle(color: Colors.white),
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.blue.shade900.withOpacity(0.5),
        selectedTextColor: Colors.white,
        deactivatedColor: Colors.white,
        height: 100,
        onDateChange: (date) {
          // New date selected
          // setState(() {
          //   _selectedValue = date;
          // });
        },
      ),
    );
  }
}
