import 'package:carbon_footprint_tracker/constants/assets.dart';
import 'package:carbon_footprint_tracker/models/category.dart';
import 'package:flutter/material.dart';

Map<int, CategoryModel> categories = {
  0: CategoryModel(
      name: "Transportation",
      icon: Icons.car_crash,
      id: 0,
      label: "Distance Traveled",
      hintText: "Enter the distance you traveled (in kilometers).",
      description:
          "Track your emissions from various modes of transportation, including cars, public transit, biking, and walking.",
      lottieURL: transportationLottieURL),
  1: CategoryModel(
      name: "Energy Consumption",
      icon: Icons.electric_bolt_rounded,
      id: 1,
      label: "Monthly Electricity Usage",
      hintText: "Input your monthly electricity usage (in kWh).",
      description:
          "Monitor your carbon footprint from electricity, heating, and other energy sources in your home.",
      lottieURL: electricityLottieURL),
  2: CategoryModel(
      name: "Home Appliances",
      icon: Icons.ac_unit_rounded,
      id: 2,
      label: "Appliance Energy Consumption",
      hintText: "Specify the energy consumption of your appliance (in kWh).",
      description:
          "Keep tabs on energy usage from household appliances like refrigerators, air conditioners, and electronics.",
      lottieURL: appliancesLottieURL),
  3: CategoryModel(
      name: "Travel and Leisure",
      icon: Icons.flight_takeoff_rounded,
      id: 3,
      label: "Distance Traveled",
      hintText: "Specify the distance you traveled (in kilometers).",
      description:
          "Calculate emissions from travel, hotel stays, and recreational activities to make eco-friendly choices.",
      lottieURL: travelLottieURL)
};
