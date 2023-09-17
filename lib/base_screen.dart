import 'package:carbon_footprint_tracker/constants/universal.dart';
import 'package:carbon_footprint_tracker/views/homescreen/home_screen.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      title: appTitle,
      home: const HomeScreen());
}
