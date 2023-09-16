import 'package:carbon_footprint_tracker/models/category.dart';
import 'package:flutter/material.dart';

List<CategoryModel> categories = [
  CategoryModel(name: "Transportation", icon: Icons.car_crash),
  CategoryModel(name: "Energy Consumption", icon: Icons.electric_bolt_rounded),
  CategoryModel(name: "Home Appliances", icon: Icons.ac_unit_rounded),
  CategoryModel(name: "Waste Management", icon: Icons.delete),
  CategoryModel(name: "Diet and Food", icon: Icons.food_bank_outlined),
  CategoryModel(name: "Travel and Leisure", icon: Icons.flight_takeoff_rounded),
  CategoryModel(name: "Work and Business", icon: Icons.business_center),
  CategoryModel(
      name: "Outdoor Activities", icon: Icons.sports_football_rounded),
  CategoryModel(name: "Other", icon: Icons.add),
];
