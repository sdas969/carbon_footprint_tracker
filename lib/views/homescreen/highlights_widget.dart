import 'package:carbon_footprint_tracker/constants/bottom_sheet.dart';
import 'package:carbon_footprint_tracker/providers/emission_provider.dart';
import 'package:carbon_footprint_tracker/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HighlightsWidget extends StatelessWidget {
  const HighlightsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Consumer<EmissionProvider>(
      builder: (context, emissionProvider, _) => Row(children: [
            if (emissionProvider.maxEmissionEntry != -1)
              Expanded(
                  flex: 1,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          leading: emissionProvider.maxEmissionEntry == null
                              ? const CircularProgressIndicator()
                              : Icon(
                                  categories[emissionProvider.maxEmissionEntry]!
                                      .icon),
                          subtitle: const Text("Max Usage"),
                          title: Text(emissionProvider.maxEmissionEntry == null
                              ? "..."
                              : "${emissionProvider.maxEmission} kg on ${categories[emissionProvider.maxEmissionEntry]!.name}")))),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                        leading: const Icon(Icons.co2_rounded),
                        title: Consumer<UserProvider>(
                            builder: (context, userProvider, _) => Text(
                                userProvider.userData == null
                                    ? "..."
                                    : "${userProvider.userData!.dailyLimit} kg Daily Limit")))))
          ]));
}
