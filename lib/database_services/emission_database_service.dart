import 'package:carbon_footprint_tracker/constants/universal.dart';
import 'package:carbon_footprint_tracker/models/emission_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmissionDatabaseService {
  Future<List<EmissionModel>> fetchData(DateTime date) async {
    if (FirebaseAuth.instance.currentUser == null) {
      return [];
    }
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final data = await FirebaseFirestore.instance
        .collection("emissionData")
        .doc(uid)
        .collection("data")
        .doc(dateFormat.format(date))
        .collection("data")
        .get();
    if (data.size == 0) {
      return [];
    }
    return data.docs
        .map((emissionData) => EmissionModel.fromJson(emissionData.data()))
        .toList();
  }

  Future<void> setData(DateTime date, int id, double emissionData) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection("emissionData")
        .doc(uid)
        .collection("data")
        .doc(dateFormat.format(date))
        .collection("data")
        .doc(id.toString())
        .set({"emission": calculatedData(id, emissionData), "id": id},
            setOptions);
  }

  double calculatedData(int id, double emissionData) {
    if (id == 0) {
      return emissionData * 10 * 2.5;
    }
    if (id == 3) {
      return 0.25 * emissionData;
    }
    if (id == 1) {
      return 0.45 * emissionData;
    }
    if (id == 2) {
      return 0.55 * emissionData;
    }
    return emissionData;
  }
}
