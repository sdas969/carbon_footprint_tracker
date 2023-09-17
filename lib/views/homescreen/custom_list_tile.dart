import 'package:carbon_footprint_tracker/constants/bottom_sheet.dart';
import 'package:carbon_footprint_tracker/models/emission_model.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.emissionData});
  final EmissionModel emissionData;

  @override
  Widget build(BuildContext context) => ListTile(
      leading: Card(
          color: const Color(0xff2f2f2f),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(categories[emissionData.id]!.icon))),
      title: Text(categories[emissionData.id]!.name),
      trailing: Text("${emissionData.emission} kg"));
}
