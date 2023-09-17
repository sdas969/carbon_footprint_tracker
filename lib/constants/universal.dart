import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const appTitle = "EcoTrack";
const List<StretchMode> stretchModes = [
  StretchMode.zoomBackground,
  StretchMode.blurBackground,
  StretchMode.fadeTitle
];

final darkTextStyle = GoogleFonts.lato().copyWith(color: Colors.white);
final lightTextStyle = GoogleFonts.lato().copyWith(color: Colors.black);
final TextTheme _textTheme = GoogleFonts.latoTextTheme();
final darkTextTheme = _textTheme.copyWith(
    titleLarge: darkTextStyle,
    titleMedium: darkTextStyle,
    titleSmall: darkTextStyle,
    headlineLarge: darkTextStyle,
    displayLarge: darkTextStyle,
    displayMedium: darkTextStyle,
    displaySmall: darkTextStyle,
    headlineMedium: darkTextStyle,
    labelMedium: darkTextStyle,
    bodyLarge: darkTextStyle,
    bodyMedium: darkTextStyle,
    bodySmall: darkTextStyle);
final ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    textTheme: darkTextTheme,
    buttonTheme: const ButtonThemeData(buttonColor: appButtonColor),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: appButtonColor)),
    inputDecorationTheme: darkInputDecorationTheme,
    appBarTheme: _appBarTheme,
    primaryTextTheme: darkTextTheme);
final InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    prefixIconColor: Colors.red,
    iconColor: Colors.red,
    enabledBorder: OutlineInputBorder(
        borderRadius: defaultBorderRadius,
        borderSide: const BorderSide(color: Colors.red)),
    border: OutlineInputBorder(
        borderRadius: defaultBorderRadius,
        borderSide: const BorderSide(color: Colors.red)),
    focusedBorder: OutlineInputBorder(
        borderRadius: defaultBorderRadius,
        borderSide: const BorderSide(color: Colors.red, width: 1.0)),
    labelStyle: const TextStyle(color: Colors.white),
    hintStyle: const TextStyle(color: Colors.white));
final AppBarTheme _appBarTheme = AppBarTheme(
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: _textTheme.bodyMedium,
    toolbarTextStyle: _textTheme.bodyMedium);
const appButtonColor = Color(0xff49847b);
final defaultBorderRadius = BorderRadius.circular(20);
final SetOptions setOptions = SetOptions(merge: true);
