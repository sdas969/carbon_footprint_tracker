import 'package:carbon_footprint_tracker/providers/emission_provider.dart';
import 'package:carbon_footprint_tracker/utils/universal.dart';
import 'package:carbon_footprint_tracker/views/homescreen/components/add_data_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DayButtonWidget extends StatelessWidget {
  const DayButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(children: [
        Expanded(
            child: Consumer<EmissionProvider>(
                builder: (context, emissionProvider, _) => Text(
                      compareDate(emissionProvider.selectedDate, DateTime.now())
                          ? "Today"
                          : "",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w300),
                    ))),
        const AddDataButton()
      ]));
}
