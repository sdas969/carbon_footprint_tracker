import 'package:carbon_footprint_tracker/constants/universal.dart';
import 'package:carbon_footprint_tracker/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDatabaseService {
  Future<UserModel> fetchData() async {
    if (FirebaseAuth.instance.currentUser == null) {
      return UserModel();
    }
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final data =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    if (data.exists) {
      return UserModel.fromJson(data.data()!);
    }
    return UserModel();
  }

  Future<void> setData(UserModel userData) async {
    if (FirebaseAuth.instance.currentUser == null) {
      return;
    }
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .set(userData.toJson(), setOptions);
  }
}
