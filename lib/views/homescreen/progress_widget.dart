import 'package:carbon_footprint_tracker/providers/emission_provider.dart';
import 'package:carbon_footprint_tracker/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Expanded(
      child: FittedBox(
          child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Consumer<UserProvider>(
                  builder: (context, userProvider, _) =>
                      Consumer<EmissionProvider>(
                          builder: (context, emissionProvider, _) {
                        final double? data = (userProvider.userData == null ||
                                userProvider.userData!.dailyLimit == null ||
                                emissionProvider.currDayStats == null)
                            ? null
                            : emissionProvider.currDayStats! /
                                userProvider.userData!.dailyLimit!;
                        return CircularProgressIndicator(
                            strokeCap: StrokeCap.round,
                            value: data,
                            strokeWidth: 1);
                      })))));
}
