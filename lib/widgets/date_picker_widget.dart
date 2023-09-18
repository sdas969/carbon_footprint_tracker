import 'package:carbon_footprint_tracker/providers/emission_provider.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    super.key,
  });

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late EmissionProvider emissionProvider;
  @override
  void initState() {
    emissionProvider = Provider.of(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
      child: DatePicker(DateTime.now(),
          dayTextStyle: const TextStyle(color: Colors.white),
          dateTextStyle: const TextStyle(color: Colors.white),
          monthTextStyle: const TextStyle(color: Colors.white),
          initialSelectedDate: DateTime.now(),
          selectionColor: Colors.blue.shade900.withOpacity(0.5),
          selectedTextColor: Colors.white,
          deactivatedColor: Colors.white,
          height: 100,
          onDateChange: (date) async =>
              await emissionProvider.changeDate(date)));
}
