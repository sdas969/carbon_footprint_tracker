import 'package:carbon_footprint_tracker/constants/onboarding.dart';
import 'package:carbon_footprint_tracker/views/onboarding/components/next_button.dart';
import 'package:carbon_footprint_tracker/views/onboarding/components/skip_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;
  int _currIndex = 0;
  @override
  void initState() {
    pageController = PageController(initialPage: _currIndex);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Align(
                        alignment: Alignment.centerRight, child: SkipButton()),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 40.0, horizontal: 8),
                            child: PageView(
                                onPageChanged: (value) =>
                                    setState(() => _currIndex = value),
                                controller: pageController,
                                children: List.generate(
                                    lottieArr.length,
                                    (index) => Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Lottie.asset(
                                                          lottieArr[index],
                                                          frameRate:
                                                              FrameRate.max))),
                                              Text(descArr[index],
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 34)),
                                              Text(subtitleArr[index],
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 16))
                                            ]))))),
                    NextButton(
                        pageController: pageController, index: _currIndex)
                  ]))));
}
