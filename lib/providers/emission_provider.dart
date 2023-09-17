import 'package:flutter/material.dart';

class EmissionProvider extends ChangeNotifier {
  int? _currDayStats;
  List<int>? _perCategoryStats;
  int? get currDayStats => _currDayStats;
  List<int>? get perCategoryStats => _perCategoryStats;

  initData() {}
}
