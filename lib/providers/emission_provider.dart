import 'package:carbon_footprint_tracker/database_services/emission_database_service.dart';
import 'package:carbon_footprint_tracker/models/emission_model.dart';
import 'package:flutter/material.dart';

class EmissionProvider extends ChangeNotifier {
  double? _currDayStats;
  List<EmissionModel>? _perCategoryStats;
  DateTime _selectedDate = DateTime.now();
  double? get currDayStats => _currDayStats;
  int? maxEmissionEntry;
  double? maxEmission;

  List<EmissionModel>? get perCategoryStats => _perCategoryStats;
  DateTime get selectedDate => _selectedDate;

  Future initData(DateTime? date) async {
    _perCategoryStats =
        await EmissionDatabaseService().fetchData(date ?? _selectedDate);
    _currDayStats = 0;
    maxEmissionEntry = -1;
    maxEmission = 0;
    for (EmissionModel element in _perCategoryStats!) {
      _currDayStats = (_currDayStats ?? 0) + element.emission!;
      if (element.emission! > maxEmission!) {
        maxEmission = element.emission!;
        maxEmissionEntry = element.id;
      }
    }
    notifyListeners();
  }

  Future changeDate(DateTime date) async {
    _selectedDate = date;
    await initData(_selectedDate);
    notifyListeners();
  }

  Future setData(DateTime date, int id, double emissionData) async {
    await EmissionDatabaseService().setData(date, id, emissionData);
    await initData(date);
  }
}
