import 'package:carbon_footprint_tracker/constants/universal.dart';
import 'package:carbon_footprint_tracker/utils/universal.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) => TextButton(
      style: TextButton.styleFrom(
          backgroundColor: appButtonColor.withOpacity(0.2)),
      onPressed: () => completeOnboard(context),
      child: const Text("Skip"));
}
