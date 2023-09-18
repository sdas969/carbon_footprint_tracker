import 'package:carbon_footprint_tracker/constants/universal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KgCo2MeterWidget extends StatelessWidget {
  const KgCo2MeterWidget({super.key, required this.data, this.size = 6});
  final double? data;
  final double size;

  @override
  Widget build(BuildContext context) => data == null
      ? const SizedBox()
      : RichText(
          text: TextSpan(
              style: GoogleFonts.lato()
                  .copyWith(textBaseline: TextBaseline.alphabetic),
              children: [
              TextSpan(
                  text: data == null ? "..." : numberFormat.format(data),
                  style: TextStyle(
                      fontSize: size,
                      textBaseline: TextBaseline.alphabetic,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: " kg",
                  style: TextStyle(
                      fontSize: size / 2,
                      textBaseline: TextBaseline.alphabetic)),
              WidgetSpan(
                  alignment: PlaceholderAlignment.baseline,
                  baseline: TextBaseline.alphabetic,
                  child: Icon(Icons.co2, size: size - 1))
            ]));
}
