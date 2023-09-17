import 'package:carbon_footprint_tracker/constants/assets.dart';
import 'package:carbon_footprint_tracker/constants/universal.dart';
import 'package:carbon_footprint_tracker/widgets/custom_dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Lottie.asset(co2LottieURL),
              const Text(
                appTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2),
              ),
              const SizedBox(height: 20),
              const TextField(
                  decoration:
                      InputDecoration(labelText: "Name", hintText: "Name"),
                  keyboardType: TextInputType.name),
              const SizedBox(height: 15),
              const TextField(
                  decoration: InputDecoration(
                      labelText: "Email", hintText: "example@abc.com"),
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 15),
              const TextField(
                  decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter a strong password"),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true),
              const SizedBox(height: 15),
              const TextField(
                  decoration: InputDecoration(
                      labelText: "Daily Carbon Limit",
                      hintText: "Enter Value in kg"),
                  keyboardType: TextInputType.number),
              const SizedBox(height: 30),
              CustomDialogButton(
                onTap: () {},
                text: 'Proceed',
                isExpanded: false,
              )
            ],
          ),
        ),
      )),
    );
  }
}
