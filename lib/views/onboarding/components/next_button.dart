import 'package:carbon_footprint_tracker/constants/onboarding.dart';
import 'package:carbon_footprint_tracker/utils/universal.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton(
      {super.key, required this.pageController, required this.index});
  final int index;

  final PageController pageController;

  @override
  Widget build(BuildContext context) => TextButton(
      onPressed: () => index == descArr.length - 1
          ? completeOnboard(context)
          : pageController.nextPage(
              duration: const Duration(milliseconds: 100),
              curve: Curves.linear),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(index == descArr.length - 1 ? "Proceed" : "Next",
              style: const TextStyle(fontSize: 18))));
}
