import 'dart:math';

import 'package:carbon_footprint_tracker/constants/assets.dart';
import 'package:carbon_footprint_tracker/providers/emission_provider.dart';
import 'package:carbon_footprint_tracker/providers/user_provider.dart';
import 'package:carbon_footprint_tracker/widgets/kg_co2_meter_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
                            : min(
                                1,
                                emissionProvider.currDayStats! /
                                    userProvider.userData!.dailyLimit!);
                        return Stack(alignment: Alignment.center, children: [
                          KgCo2MeterWidget(data: emissionProvider.currDayStats),
                          CircularProgressIndicator(
                              backgroundColor:
                                  Colors.greenAccent.withOpacity(0.2),
                              strokeCap: StrokeCap.round,
                              color: data == null
                                  ? null
                                  : (data == 1)
                                      ? Colors.redAccent
                                      : Colors.greenAccent,
                              value: data,
                              strokeWidth: 3),
                          Positioned(
                              right: 0,
                              bottom: 0,
                              child: Lottie.asset(plantLottieURL,
                                  frameRate: FrameRate.max,
                                  fit: BoxFit.fitHeight,
                                  height: 20,
                                  width: 4))
                        ]);
                      })))));
}
