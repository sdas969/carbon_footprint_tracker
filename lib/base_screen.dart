import 'package:carbon_footprint_tracker/constants/universal.dart';
import 'package:carbon_footprint_tracker/views/auth/auth_screen.dart';
import 'package:carbon_footprint_tracker/views/homescreen/home_screen.dart';
import 'package:carbon_footprint_tracker/views/onboarding/onboarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      title: appTitle,
      home: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
            if (!snapshot.hasData) {
              return const Scaffold(
                  body: Center(child: CircularProgressIndicator()));
            }
            final hasOnboarded = snapshot.data!.containsKey("hasOnboarded") &&
                (snapshot.data!.getBool("hasOnboarded") ?? false);
            if (!hasOnboarded) {
              return const OnboardingScreen();
            }
            return FirebaseAuth.instance.currentUser == null
                ? const AuthScreen()
                : const HomeScreen();
          }));
}
