import 'package:carbon_footprint_tracker/database_services/user_database_service.dart';
import 'package:carbon_footprint_tracker/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _userData;

  UserModel? get userData => _userData;

  initData() async {
    _userData = await UserDatabaseService().fetchData();
    notifyListeners();
  }

  setData(UserModel userData) {
    UserDatabaseService()
        .setData(userData)
        .then((value) => _userData = userData);
    notifyListeners();
  }
}
