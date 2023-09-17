import 'package:flutter/material.dart';

class CategoryModel {
  CategoryModel(
      {required this.name,
      required this.icon,
      required this.id,
      required this.lottieURL,
      required this.description,
      required this.hintText,
      required this.label});
  final String name, lottieURL, description, label, hintText;
  final IconData icon;
  final int id;
}
